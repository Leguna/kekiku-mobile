import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kekiku/core/widgets/my_countdown/my_countdown_cubit.dart';

class MyCountdown extends StatelessWidget {
  const MyCountdown({
    super.key,
    this.onFinished,
    this.duration = const Duration(seconds: 60),
    this.bloc,
    this.style,
  });

  final MyCountdownCubit? bloc;
  final Function? onFinished;
  final Duration duration;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final cubit = bloc ?? MyCountdownCubit();
    cubit.startCountdown(duration);
    return BlocConsumer<MyCountdownCubit, MyCountdownState>(
      bloc: cubit,
      listener: (context, state) {
        state.maybeWhen(
          orElse: () {},
          finished: () {
            onFinished?.call();
          },
        );
      },
      builder: (context, state) {
        return Text(
          style: style,
          state.maybeWhen(
            orElse: () => '',
            counting: (count) {
              return count.toString();
            },
          ),
        );
      },
    );
  }
}
