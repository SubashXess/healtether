import 'package:flutter/material.dart';

import '../constants/themes.dart';

showSnackBar(
  BuildContext context, {
  required String message,
  Color? bgColor = Colors.grey,
  Color? actionLabelColor = Colors.blue,
  String? label,
  Function()? onPressed,
}) {
  return ScaffoldMessenger.of(context)
    ..removeCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content:
            Text(message, style: AppTextStyle.h4TextStyle(color: Colors.white)),
        action: label != null
            ? SnackBarAction(
                label: label,
                textColor: actionLabelColor,
                onPressed: onPressed!,
              )
            : null,
      ),
    );
}
