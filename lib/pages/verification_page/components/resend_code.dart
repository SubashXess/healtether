import 'package:flutter/material.dart';
import '../../../constants/themes.dart';

class ResendCodeCheck extends StatelessWidget {
  const ResendCodeCheck(
      {super.key,
      required this.resend,
      required this.onTap,
      required this.timer});

  final bool resend;
  final Function() onTap;
  final String timer;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          resend ? 'Resend code in ' : 'Didn\'t get the code? ',
          style: AppTextStyle.h4TextStyle(color: Colors.grey.shade500),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            resend ? '${timer}s' : 'Resend',
            style: AppTextStyle.h4TextStyle(
              color: AppTheme.appThemeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    );
  }
}
