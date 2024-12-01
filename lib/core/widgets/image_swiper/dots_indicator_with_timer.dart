import 'dart:async';

import 'package:flutter/material.dart';

import 'timer_fill_indicator.dart';

class DotsIndicatorWithTimer extends StatefulWidget {
  const DotsIndicatorWithTimer({
    super.key,
    required this.controller,
    required this.itemCount,
    this.color = Colors.white,
    this.onPageSelected,
    this.duration = const Duration(seconds: 5),
  });

  final PageController controller;
  final int itemCount;
  final Color color;
  final ValueChanged<int>? onPageSelected;
  final Duration duration;

  @override
  State<DotsIndicatorWithTimer> createState() => _DotsIndicatorWithTimerState();
}

class _DotsIndicatorWithTimerState extends State<DotsIndicatorWithTimer> {
  late Timer _timer;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

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
            onSelected: () {
              setState(() {
                _currentIndex = index;
                widget.onPageSelected?.call(index);
              });
            },
          ),
        );
      }),
    );
  }

  void _startTimer() {
    _timer = Timer.periodic(widget.duration, (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.itemCount;
        widget.controller.animateToPage(
          _currentIndex,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
      });
    });
  }
}
