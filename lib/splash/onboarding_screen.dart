import 'package:flutter_svg/flutter_svg.dart';
import 'package:kekiku/auth/views/google_sso_button.dart';
import 'package:kekiku/splash/bloc/onboarding_cubit.dart';

import '../core/index.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = OnboardingCubit();
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<OnboardingCubit, OnboardingState>(
          listener: (context, state) {
        state.maybeWhen(
          success: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              Routes.home,
              (route) => false,
            );
          },
          orElse: () {},
        );
      }, builder: (context, state) {
        cubit.init();
        return _buildContent(context);
      }),
    );
  }

  _buildContent(BuildContext context) {
    final cubit = context.read<OnboardingCubit>();
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Text(
                  style: AppTextStyles.title,
                  Strings.appName,
                ),
              ),
              Container(
                color: AppColors.breadColorLight,
                padding: const EdgeInsets.all(32),
                width: double.infinity,
                child: SvgPicture.asset(
                  Assets.welcome.path,
                  width: 200,
                  height: 200,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    const SizedBox(height: 32),
                    Text(
                      Strings.onboardingTitle,
                      style: AppTextStyles.title,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      Strings.onboardingDescription,
                      textAlign: TextAlign.center,
                      style: AppTextStyles.medium,
                    ),
                    const SizedBox(height: 32),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
              ),
              onPressed: () {
                context.read<OnboardingCubit>().done();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
              },
              child: const Text(
                Strings.orderNow,
                style: TextStyle(color: Colors.white),
              ),
            ),
            GoogleSsoButton(
              onSignIn: () {
                cubit.done();
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.home,
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
