import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../core/index.dart';
import '../bloc/auth_cubit.dart';
import '../models/user.dart';

part 'edit_profile_cubit.freezed.dart';
part 'edit_profile_state.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  EditProfileCubit(this.authCubit) : super(const EditProfileState.initial());

  final AuthCubit authCubit;
  final ds = getIt<AuthRepository>();

  TextEditingController value = TextEditingController();

  User? user;

  bool get isLoading =>
      state.maybeWhen(loading: (fullscreen) => true, orElse: () => false);

  Future<void> changePhotoProfile() async {
    try {
      emit(const EditProfileState.loading(fullscreen: true));
      XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image != null) {
        final photo = await ds.uploadImage(image);
        user = user?.copyWith(photo: photo);
        await ds.setUser(user!);
        await authCubit.setUser(user!);
      }
      emit(EditProfileState.success(user!));
    } catch (e) {
      emit(EditProfileState.error(e.toString()));
    }
  }

  Future<void> editProfileValue(ProfileField type, dynamic value) async {
    try {
      emit(const EditProfileState.loading());
      if (user == null) return;
      user = await ds.updateProfile({type: value});
      await authCubit.setUser(user!);
      emit(EditProfileState.success(user!));
    } catch (e) {
      return emit(EditProfileState.error(e.toString()));
    }
    await getUser();
  }

  Future<void> getLocalUser() async {
    emit(const EditProfileState.loading(fullscreen: false));
    user = await ds.getLocalUser();
    emit(EditProfileState.success(user!));
  }

  Future<void> getUser({fullscreenLoading = true}) async {
    try {
      emit(EditProfileState.loading(fullscreen: fullscreenLoading));
      user = await ds.getProfile();
      authCubit.setUser(user!);
      setBirthdayController();
      emit(EditProfileState.success(user!));
    } catch (e) {
      emit(EditProfileState.error(e.toString()));
    }
  }

  Future<void> deleteAccount() async {
    try {
      emit(const EditProfileState.loading());
      await ds.deleteAccount();
      await authCubit.logout();
      user = null;
      emit(const EditProfileState.deleted());
    } catch (e) {
      emit(EditProfileState.error(e.toString()));
    }
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
    if (user?.dateOfBirth == null || user?.dateOfBirth == '') return;
    final birthday = user?.dateOfBirth ?? '';
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
    await editProfileValue(ProfileField.dateOfBirth, birthday);
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
