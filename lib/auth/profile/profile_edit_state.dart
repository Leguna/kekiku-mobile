part of 'profile_edit_cubit.dart';

@freezed
class ProfileEditState with _$ProfileEditState {
  const factory ProfileEditState.initial() = _Initial;
  const factory ProfileEditState.loading() = _Loading;
  const factory ProfileEditState.error(String message) = _Error;
  const factory ProfileEditState.success(User user) = _Success;
}
