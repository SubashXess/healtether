import 'package:flutter/material.dart';
import 'package:healtether/constants/themes.dart';
import 'package:healtether/pages/splashpage/splashpage.dart';
import 'package:healtether/providers/bottom_navbar_provider.dart';
import 'package:healtether/providers/login_providers.dart';
import 'package:provider/provider.dart';

import 'database/shared_preference.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Initialize UserPreferences
  await UserPreferences().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => BottomNavBarProvider()),
      ],
      child: MaterialApp(
        title: 'HealTether',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.teal, fontFamily: AppTextStyle.fontFamily),
        home: const SplashPage(),
      ),
    );
  }
}
