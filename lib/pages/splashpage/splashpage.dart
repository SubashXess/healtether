import 'dart:async';
import 'package:flutter/material.dart';
import 'package:healtether/pages/welcomepage/welcomepage.dart';
import 'package:healtether/providers/login_providers.dart';
import 'package:healtether/utilities/navigators.dart';
import 'package:provider/provider.dart';
import '../../constants/themes.dart';
import '../dashboard.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    checkUserLoggedIn();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 86.0,
              height: 86.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: Colors.grey.shade300,
              ),
              child: Center(
                child: Text('Logo', style: AppTextStyle.h3TextStyle()),
              ),
            ),
            const SizedBox(height: 10.0),
            Text('HealTether', style: AppTextStyle.h1TextStyle()),
            const SizedBox(height: 10.0),
            const SizedBox(
              width: 26.0,
              height: 26.0,
              child: Center(
                child: CircularProgressIndicator(
                  color: AppTheme.appThemeColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void checkUserLoggedIn() async {
    final provider = context.read<LoginProvider>();
    Timer(const Duration(milliseconds: 2800), () {
      if (provider.isLoggedIn == false) {
        navigatorPushReplacement(context, const WelcomePage());
      } else {
        navigatorPushReplacement(context, const Dashboard());
      }
    });
  }
}
