import 'dart:async';

import 'package:flutter/material.dart';

class TimerFillIndicator extends StatefulWidget {
  const TimerFillIndicator({
    super.key,
    this.duration = const Duration(seconds: 3),
    this.color = Colors.white,
    this.backgroundColor = Colors.grey,
    this.height = 8.0,
    this.width = 32,
    this.fillPercentage = 0.0,
    this.onSelected,
    this.isSelected = false,
  });

  final bool isSelected;
  final Duration duration;
  final Color color;
  final Color backgroundColor;
  final double height;
  final double width;
  final double fillPercentage;
  final VoidCallback? onSelected;

  @override
  State<TimerFillIndicator> createState() => _TimerFillIndicatorState();
}

class _TimerFillIndicatorState extends State<TimerFillIndicator> {
  double _fillPercentage = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    if (widget.isSelected == true) {
      _startFilling();
    }
  }

  void _startFilling() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        setState(() {
          _fillPercentage += 0.05;
          if (_fillPercentage >= 1.0) {
            widget.onSelected?.call();
            _fillPercentage = 0.0;
            _timer.cancel();
          }
        });
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = widget.isSelected ? widget.width : 8;
    Color color = widget.isSelected ? widget.color : widget.backgroundColor;

    return InkWell(
      onTap: () {
        widget.onSelected?.call();
        _fillPercentage = 0.0;
      },
      child: AnimatedContainer(
        width: width,
        height: widget.height,
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: widget.backgroundColor,
          borderRadius: BorderRadius.circular(4.0),
        ),
        duration: const Duration(milliseconds: 500),
        child: AnimatedContainer(
          width: 12,
          height: widget.height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(4.0),
          ),
          duration: const Duration(milliseconds: 100),
        ),
      ),
    );
  }
}
