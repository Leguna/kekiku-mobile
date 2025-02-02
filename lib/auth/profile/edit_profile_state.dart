part of 'edit_profile_cubit.dart';

@freezed
class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;

  const factory EditProfileState.loading({@Default(true) bool fullscreen}) =
      _Loading;

  const factory EditProfileState.error(String message) = _Error;

  const factory EditProfileState.success(User user) = _Success;

  const factory EditProfileState.deleted() = _Deleted;

  const factory EditProfileState.changed(ProfileField type) = _Changed;
}
