import 'package:flutter/material.dart';

class TimerFillIndicator extends StatefulWidget {
  const TimerFillIndicator({
    super.key,
    this.duration = const Duration(seconds: 5),
    this.color = Colors.white,
    this.backgroundColor = Colors.grey,
    this.height = 8.0,
    this.width = 32,
    this.onTimerEnd,
    this.isSelected = false,
    this.onTap,
  });

  final bool isSelected;
  final Duration duration;
  final Color color;
  final Color backgroundColor;
  final double height;
  final double width;
  final VoidCallback? onTimerEnd;
  final VoidCallback? onTap;

  @override
  State<TimerFillIndicator> createState() => _TimerFillIndicatorState();
}

class _TimerFillIndicatorState extends State<TimerFillIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    );

    _animation = Tween<double>(begin: 0, end: 1).animate(_controller)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          widget.onTimerEnd?.call();
        }
      });

    _startAnimationIfSelected();
  }
  @override
  void didUpdateWidget(covariant TimerFillIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _startAnimationIfSelected();
  }

  void _startAnimationIfSelected() {
    if (widget.isSelected) {
      _controller.forward(from: 0);
    } else {
      _controller.reset();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double width = widget.isSelected ? widget.width : 8;
    return InkWell(
      onTap: () {
        if (widget.isSelected) {
          return;
        }
        widget.onTap?.call();
      },
      child: AnimatedContainer(
        width: width,
        height: widget.height,
        curve: Curves.easeInOut,
        duration: const Duration(milliseconds: 500),
        decoration: BoxDecoration(
          color: widget.backgroundColor.withAlpha(125),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: _animation.value,
              child: Container(
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
