import 'package:flutter/material.dart';

import '../index.dart';

showMySnackBar(context, String message, {bool error = true}) {
  ScaffoldMessenger.of(context).removeCurrentSnackBar();
  SnackBar snackBar = SnackBar(
    content: Text(removeExceptionPrefix(message)),
    backgroundColor: error ? Colors.greenAccent : Colors.redAccent,
    dismissDirection: DismissDirection.horizontal,
    behavior: SnackBarBehavior.floating,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

showMyModalBottomSheet(
  BuildContext context, {
  Widget? child,
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
      return child ?? const SizedBox();
    },
  );
}

showMyModalOptionBottomSheet(
  BuildContext context, {
  String title = '',
  String description = '',
  VoidCallback? onConfirm,
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
