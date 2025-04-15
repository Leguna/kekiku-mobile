part of 'edit_profile_cubit.dart';

@freezed
sealed class EditProfileState with _$EditProfileState {
  const factory EditProfileState.initial() = _Initial;

  const factory EditProfileState.loading({@Default(true) bool fullscreen}) =
      EditProfileLoading;

  const factory EditProfileState.error(String message) = ProfileError;

  const factory EditProfileState.success(User user) = Success;

  const factory EditProfileState.deleted() = Deleted;

  const factory EditProfileState.changed(ProfileField type) = Changed;
}
