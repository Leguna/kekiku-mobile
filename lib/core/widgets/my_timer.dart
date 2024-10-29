import 'package:flutter/material.dart';

class MyTimer extends StatefulWidget {
  const MyTimer({super.key, required this.duration, this.onEnd});

  final int duration;
  final Function? onEnd;

  @override
  State<MyTimer> createState() => _MyTimerState();
}

class _MyTimerState extends State<MyTimer> {
  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: Duration(seconds: widget.duration),
      onEnd: () {
        if (widget.onEnd != null) {
          widget.onEnd!();
        }
      },
      builder: (context, value, child) {
        return Text(
          '${(widget.duration * value).ceil()}',
          style: const TextStyle(
            fontSize: 24,
          ),
        );
      },
    );
  }
}
