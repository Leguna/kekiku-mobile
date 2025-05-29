
import '../index.dart';

class MyScaffold extends StatelessWidget {
  const MyScaffold({
    super.key,
    this.isMiddle = false,
    required this.body,
    this.appBar,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.infoText = '',
  });

  final bool isMiddle;
  final Widget body;
  final PreferredSizeWidget? appBar;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final String infoText;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Container(
            color: AppColors.midnightBlue,
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: EdgeInsets.only(
              top: infoText.isEmpty ? 0.0 : 48,
            ),
            child: Scaffold(
              appBar: appBar,
              bottomSheet: bottomSheet,
              body: SafeArea(
                child: body,
              ),
              bottomNavigationBar: bottomNavigationBar,
            ),
          ),
          if (infoText.isNotEmpty)
            ...[
              SafeArea(
                child: Container(
                  width: double.infinity,
                  height: 48,
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                  ),
                  color: Theme.of(context).primaryColorDark,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(infoText, style: AppTextStyles.small),
                  ),
                ),
              ),
            ]
        ],
      ),
    );
  }
}
