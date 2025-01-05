import 'package:lottie/lottie.dart';

import '../index.dart';
import 'bottom_nav_bar/bloc/bottom_nav_bar_cubit.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      appBar: AppBar(
        title: const Text(Strings.notFound),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 32),
              Lottie.asset(
                reverse: true,
                Assets.lotties.maintenance,
                height: 400,
              ),
              Text(Strings.oops, style: Theme.of(context).textTheme.titleLarge),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  context.read<BottomNavBarCubit>().reset();
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    Routes.home,
                    (route) => false,
                  );
                },
                child: const Text(Strings.backToHome),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
