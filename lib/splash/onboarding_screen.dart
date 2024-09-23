import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kekiku/core/widgets/google_sso_button.dart';
import 'package:kekiku/splash/bloc/onboarding_cubit.dart';

import '../core/index.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
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
        final cubit = context.read<OnboardingCubit>();
        cubit.init();
        return _buildContent(context);
      }),
    );
  }

  _buildContent(context) {
    return MyScaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
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
                    Assets.welcome,
                    width: 200,
                    height: 200,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      Text(
                        Strings.onboardingTitle,
                        style: AppTextStyles.poppins,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        Strings.onboardingDescription,
                        textAlign: TextAlign.center,
                        style: AppTextStyles.small,
                      ),
                      const SizedBox(height: 32),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primaryColor,
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          // Navigate to the next screen
                          Navigator.pushNamedAndRemoveUntil(
                              context, Routes.home, (route) => false);
                        },
                        child: const Text(
                          Strings.orderNow,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 8),
                      const GoogleSsoButton(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
