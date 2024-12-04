
import '../index.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    this.onPressed,
    this.child,
    this.height,
    this.title,
    this.isCircleRadius = true,
    this.color,
    this.borderSide = BorderSide.none,
    this.isEnable = true,
    this.alignment,
  });

  final Color? color;
  final bool isCircleRadius;
  final String? title;
  final VoidCallback? onPressed;
  final Widget? child;
  final double? height;
  final bool isEnable;
  final BorderSide borderSide;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(0, height ?? 40.0),
        alignment: alignment,
        backgroundColor: color ?? AppColors.primaryColor,
        disabledBackgroundColor: Colors.grey[300],
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(isCircleRadius ? 100.0 : 16.0),
          side: borderSide,
        ),
        foregroundColor: Colors.black,
      ),
      onPressed: !isEnable
          ? null
          : () {
              ScaffoldMessenger.of(context).removeCurrentSnackBar();
              WidgetsBinding.instance.addPostFrameCallback((_) {
                onPressed?.call();
              });
            },
      child: child ??
          (title == null
              ? const SizedBox()
              : Text(
                  title ?? '',
                )),
    );
  }
}
