import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

import '../bloc/auth_cubit.dart';
import '../models/user.dart';
import '../../core/index.dart';
import '../../core/services/google_sso.dart';

part 'profile_edit_state.dart';
part 'profile_edit_cubit.freezed.dart';

class ProfileEditCubit extends Cubit<ProfileEditState> {
  ProfileEditCubit() : super(const ProfileEditState.initial());

  final db = getIt<LocalDatabase>();
  final ds = getIt<AuthRepository>();

  User? user;

  Future<void> changePhotoProfile() async {
    emit(const ProfileEditState.loading());
    XFile? image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      user = user!.copyWith(photoUrl: image.path);
      await db.setString(userKey, jsonEncode(user!.toJson()), boxKey: authBox);
    } else {
      emit(const ProfileEditState.error('Failed to pick image'));
    }
  }

  Future<void> deleteAccount() async {
    emit(const ProfileEditState.loading());
    await db.clearKey(userKey, boxKey: authBox);
    final googleSignIn = getIt<GoogleSSOService>();
    await googleSignIn.googleSignIn.signOut();
    user = null;
    emit(const ProfileEditState.initial());
  }

}