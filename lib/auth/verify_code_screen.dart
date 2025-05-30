import '../core/index.dart';
import 'bloc/auth_cubit.dart';

class VerifyCodeScreen extends StatelessWidget {
  const VerifyCodeScreen({
    super.key,
    this.isEmail = true,
  });

  final bool isEmail;

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          switch (state) {
            case AuthState.verified:
              context.read<AuthCubit>().passwordController.clear();
              Navigator.pushNamed(context, Routes.createProfile);
              break;
          }
        },
        builder: (context, state) {
          final isLoading = switch (state) {
            AuthState.loading => true,
            _ => false,
          };
          final cubit = context.read<AuthCubit>();
          final countdownCubit = MyCountdownCubit();
          final canResend = context.read<AuthCubit>().canResend;
          if (isLoading) return const MyLoading();
          return SingleChildScrollView(
            padding: const EdgeInsets.all(Dimens.xlarge),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Icon(
                  isEmail ? Icons.email : Icons.phone,
                  size: 48,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 16),
                Text(
                  Strings.inputVerificationCode,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.titleHome,
                ),
                const SizedBox(height: 16),
                Text(
                  (isEmail
                          ? Strings.verificationCodeSendByEmail
                          : Strings.verificationCodeSendByPhone) +
                      cubit.emailController.text,
                  style: Theme.of(context).textTheme.labelSmall,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 200,
                  child: TextFormField(
                    controller:
                        context.read<AuthCubit>().verificationCodeController,
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    maxLength: 6,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    onChanged: cubit.validateFormVerifyCode,
                    style: AppTextStyles.titleHome.copyWith(
                      letterSpacing: 12,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      counter: SizedBox.shrink(),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                canResend
                    ? TextButton(
                        onPressed: cubit.resendCodeVerificationCode,
                        child: const Text(Strings.resendCode),
                      )
                    : Wrap(
                        children: [
                          Text(
                            Strings.pleaseWait,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          MyCountdown(
                            bloc: countdownCubit,
                            duration: const Duration(seconds: 10),
                            onFinished: cubit.onTimerVerifyEnd,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                          Text(
                            Strings.toResend,
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
