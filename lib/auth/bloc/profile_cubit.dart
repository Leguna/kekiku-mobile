import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/index.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(const ProfileState.initial());
}
