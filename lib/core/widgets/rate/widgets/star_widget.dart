import 'package:kekiku/core/widgets/rate/rating_cubit.dart';

import '../../../index.dart';

class StarWidget extends StatefulWidget {
  const StarWidget({
    super.key,
    this.ratingPosition = 1,
    this.onTap,
    required this.bloc,
  });

  final int ratingPosition;
  final void Function()? onTap;
  final RatingCubit bloc;

  @override
  State<StarWidget> createState() => _StarWidgetState();
}

class _StarWidgetState extends State<StarWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 1.3).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );

    _colorAnimation = ColorTween(
      begin: Colors.grey,
      end: Colors.amber,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.bounceInOut,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RatingCubit, RatingState>(
      bloc: widget.bloc,
      listener: (context, state) {},
      builder: (context, state) {
        int currentRatingDiff =
            (widget.ratingPosition - widget.bloc.currentRating).abs();
        bool isActive = widget.bloc.lastRating >= widget.ratingPosition;
        int delayDuration = (300 - (currentRatingDiff * 100)).clamp(0, 1000);
        if (isActive) {
          Future.delayed(
              Duration(
                milliseconds: delayDuration,
              ), () {
            _controller.forward();
          });
        } else {
          Future.delayed(
              Duration(
                milliseconds: delayDuration,
              ), () {
            _controller.reverse();
          });
        }
        return GestureDetector(
          onTap: widget.onTap == null
              ? null
              : () {
                  widget.onTap?.call();
                },
          child: Padding(
            padding: const EdgeInsets.all(4),
            child: AnimatedBuilder(
              animation: _scaleAnimation,
              builder: (context, child) {
                return Transform.scale(
                  scale: _scaleAnimation.value,
                  child: Icon(
                    Icons.star,
                    color: _colorAnimation.value,
                    size: Dimens.xXLarge,
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
