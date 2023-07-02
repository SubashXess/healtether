import 'package:flutter/material.dart';
import 'package:healtether/constants/themes.dart';
import 'package:healtether/pages/loginpage/loginpage.dart';
import 'package:healtether/utilities/navigators.dart';

import '../../widgets/rounded_button_widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          // Positioned(
          //   left: 0.0,
          //   right: 0.0,
          //   bottom: -140.0,
          //   child: SvgPicture.asset(
          //     'assets/images/welcome-assets.svg',
          //     width: size.width,
          //     height: size.height * 0.6,
          //     fit: BoxFit.contain,
          //   ),
          // ),
          Container(
            padding: const EdgeInsets.all(16.0),
            alignment: Alignment.bottomCenter,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
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
                Text.rich(
                  textAlign: TextAlign.center,
                  TextSpan(
                    children: [
                      TextSpan(
                          text: 'HealTether\n',
                          style: AppTextStyle.h1TextStyle(size: 24.0)),
                      TextSpan(
                          text: 'Your Healing Partner',
                          style: AppTextStyle.h1TextStyle(
                              color: AppTheme.appThemeColor)),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Share your clinic\'s link and increase\nfootfall by upto 100%',
                  textAlign: TextAlign.center,
                  style: AppTextStyle.h4TextStyle(
                      color: AppTextTheme.appTextThemeLight, size: 15.0),
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
          Positioned(
            bottom: 16.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  RoundedButton(
                    size: size,
                    label: 'Login',
                    onTap: () => navigatorPush(context, const LoginPage()),
                  ),
                  const SizedBox(height: 10.0),
                  RoundedButton(
                    size: size,
                    label: 'Sign Up',
                    bordered: true,
                    labelColor: AppTheme.appThemeColor,
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
