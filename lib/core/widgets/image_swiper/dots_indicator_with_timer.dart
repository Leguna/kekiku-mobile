import 'package:flutter/material.dart';

import 'timer_fill_indicator.dart';

class DotsIndicatorWithTimer extends StatefulWidget {
  const DotsIndicatorWithTimer({
    super.key,
    required this.itemCount,
    this.color = Colors.white,
    this.onTimerEnd,
    this.duration = const Duration(seconds: 5),
  });

  final int itemCount;
  final Color color;
  final ValueChanged<int>? onTimerEnd;
  final Duration duration;

  @override
  State<DotsIndicatorWithTimer> createState() => DotsIndicatorWithTimerState();
}

class DotsIndicatorWithTimerState extends State<DotsIndicatorWithTimer> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(widget.itemCount, (index) {
        return Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: TimerFillIndicator(
            isSelected: index == _currentIndex,
            duration: widget.duration,
            onTimerEnd: () {
              final nextPosition = (_currentIndex + 1) % widget.itemCount;
              updateIndex(nextPosition);
              widget.onTimerEnd?.call(nextPosition);
            },
            onTap: () {
              updateIndex(index);
              widget.onTimerEnd?.call(index);
            },
          ),
        );
      }),
    );
  }

  void updateIndex(int index) {
    setState(() {
      _currentIndex = index % widget.itemCount;
    });
  }
}
