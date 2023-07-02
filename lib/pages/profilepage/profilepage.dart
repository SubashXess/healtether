import 'package:flutter/material.dart';
import 'package:healtether/constants/themes.dart';
import 'package:healtether/pages/loginpage/loginpage.dart';
import 'package:healtether/utilities/navigators.dart';
import 'package:healtether/widgets/rounded_button_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../database/shared_preference.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String phoneNumber = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(phoneNumber, style: AppTextStyle.h4TextStyle()),
              const SizedBox(height: 16.0),
              RoundedButton(
                size: MediaQuery.of(context).size,
                label: 'Logout',
                backgroundColor: Colors.redAccent,
                labelColor: Colors.white,
                onTap: () {
                  UserPreferences().setBoolValue('login', false);
                  UserPreferences().close().then((value) =>
                      navigatorPushRemove(context, const LoginPage()));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void getData() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    phoneNumber = preferences.getString('phone') ?? '';
    setState(() {});
  }
}
