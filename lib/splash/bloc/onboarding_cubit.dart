import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/index.dart';

part 'onboarding_cubit.freezed.dart';
part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(const OnboardingState.initial());

  final db = getIt<LocalDatabase>();

  init() async {
    final isFirstTime = await db.getBool(firstTimeKey) ?? true;
    if (!isFirstTime) {
      emit(const OnboardingState.success());
    }
  }

  Future<void> done() async {
    await db.setBool(firstTimeKey, false);
    emit(const OnboardingState.success());
  }
}
