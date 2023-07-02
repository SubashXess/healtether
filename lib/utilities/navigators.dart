import 'package:flutter/material.dart';

Future<void> navigatorPush(BuildContext context, page) async {
  await Navigator.push(context, MaterialPageRoute(builder: (_) => page));
}

void navigatorPushReplacement(BuildContext context, page) {
  Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => page));
}

void navigatorPushRemove(BuildContext context, page) {
  Navigator.pushAndRemoveUntil(
      context, MaterialPageRoute(builder: (_) => page), (route) => false);
}
