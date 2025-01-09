import '../index.dart';

showMySnackBar(context, String message, {bool error = true}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  SnackBar snackBar = SnackBar(
    content: Text(removeExceptionPrefix(message)),
    backgroundColor: error ? Colors.red : Colors.green,
    dismissDirection: DismissDirection.horizontal,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showMyModalBottomSheet(
  BuildContext context, {
  Widget? child,
  String title = "",
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(Dimens.medium),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  child ?? const SizedBox(),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).viewInsets.bottom),
          ],
        ),
      );
    },
  );
}

showMyModalOptionBottomSheet(
  BuildContext context, {
  String title = '',
  String description = '',
  VoidCallback? onConfirm,
  List<String> options = const [],
  onSelected,
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(16.0),
        topRight: Radius.circular(16.0),
      ),
    ),
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16.0),
            topRight: Radius.circular(16.0),
          ),
          color: AppColors.primaryColor,
        ),
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Column(mainAxisSize: MainAxisSize.min, children: [
          Text(
            title,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Text(
            description,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                title: Strings.save,
                borderSide: const BorderSide(color: Colors.black),
                color: AppColors.greenButton,
                onPressed: () {
                  onConfirm?.call();
                  Navigator.of(context).pop();
                },
              ),
              const SizedBox(width: 16.0),
              MyButton(
                title: Strings.cancel,
                borderSide: const BorderSide(color: Colors.black),
                color: AppColors.redButton,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        ]),
      );
    },
  );
}

showMyDialogOption(
  BuildContext context, {
  String title = '',
  String description = '',
  VoidCallback? onConfirm,
  confirmText = Strings.save,
  cancelText = Strings.cancel,
}) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Center(child: Text(title)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              description,
              textAlign: TextAlign.center,
            ),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.secondary,
            ),
            child: Text(
              cancelText,
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondary,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              onConfirm?.call();
              Navigator.pop(context);
            },
            child: Text(confirmText),
          ),
        ],
      );
    },
  );
}

getWidgetSize(GlobalKey key) {
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  return renderBox.size;
}

getWidgetPosition(GlobalKey key) {
  final RenderBox renderBox =
      key.currentContext!.findRenderObject() as RenderBox;
  return renderBox.localToGlobal(Offset.zero);
}

scrollToKey(GlobalKey key, {int scrollSpeed = 200, double alignment = 0.1}) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(
      context,
      alignment: alignment,
      duration: Duration(milliseconds: scrollSpeed),
      curve: Curves.easeInOut,
    );
  }
}
