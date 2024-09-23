import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/index.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initial());

  init() async {
    final db = getIt<LocalDatabase>();
    final isFirstTime = await db.getBool(firstTimeKey);
    if (isFirstTime == null) {
      await db.setBool(firstTimeKey, false);
      emit(const OnboardingState.initial());
    } else {
      emit(const OnboardingState.success());
    }
  }
}
