import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../core/index.dart';
import '../bloc/auth_cubit.dart';
import '../models/user.dart';

part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.authCubit) : super(const EditProfileState.initial()) {
    getUser();
  }

  final AuthCubit authCubit;
  final ds = getIt<AuthRepository>();

  TextEditingController value = TextEditingController();

  User? user;

  Future<void> changePhotoProfile() async {
    emit(const EditProfileState.loading());
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      user = user?.copyWith(photoUrl: image.path);
      await ds.setUser(user!);
      authCubit.setUser(user!);
      emit(EditProfileState.success(user!));
    } else {
      emit(const EditProfileState.error('Failed to pick image'));
    }
  }

  Future<void> editProfileValue(ProfileField type, dynamic value) async {
    try {
      emit(const EditProfileState.loading());
      await Future.delayed(const Duration(seconds: 1));
      if (user == null) {
        emit(const EditProfileState.error('User not found'));
        return;
      }
      user = copyWithField(type, value, user!);
      await authCubit.setUser(user!);
      emit(EditProfileState.success(user!));
    } catch (e) {
      emit(EditProfileState.error(e.toString()));
    }
    await getUser();
  }

  Future<void> getUser() async {
    emit(const EditProfileState.loading());
    try {
      user = await ds.getUser();
      setBirthdayController();
      emit(EditProfileState.success(user!));
    } catch (e) {
      emit(EditProfileState.error(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    emit(const EditProfileState.loading());
    await ds.deleteAccount();
    await authCubit.logout();
    user = null;
    emit(const EditProfileState.deleted());
  }

  Future<void> setValue(ProfileField type) async {
    value.text = getTypeValue(type, user);
    emit(EditProfileState.changed(type));
  }

  var dayController = FixedExtentScrollController();
  var monthController = FixedExtentScrollController();
  var yearController = FixedExtentScrollController();

  void setBirthdayController() {
    if (user == null) return;
    if (user?.birthday == null || user?.birthday == '') return;
    final birthday = user?.birthday ?? '';
    final date = birthday.split(' ');
    final dayIndex = day.indexOf(date[0]);
    final monthIndex = month.indexOf(date[1]);
    final yearIndex = year.indexOf(date[2]);
    dayController = FixedExtentScrollController(initialItem: dayIndex);
    monthController = FixedExtentScrollController(initialItem: monthIndex);
    yearController = FixedExtentScrollController(initialItem: yearIndex);
  }

  Future<void> setProfileBirthday() async {
    final dayIndex = dayController.selectedItem % 31;
    final monthIndex = monthController.selectedItem % 12;
    final yearIndex = yearController.selectedItem % 100;
    final birthday = '${day[dayIndex]} ${month[monthIndex]} ${year[yearIndex]}';
    await editProfileValue(ProfileField.birthday, birthday);
  }
}

final day =
    List.generate(31, (index) => (index + 1).toString().padLeft(2, '0'));
final month = List.generate(12, (index) {
  DateTime date = DateTime(2000, index + 1, 1);
  return DateFormat.MMMM().format(date);
});
final year = List.generate(100, (index) {
  DateTime date = DateTime.now().subtract(Duration(days: 365 * index));
  return DateFormat.y().format(date);
});
