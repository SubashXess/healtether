import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  String? _selectedCountry;
  String? get selectedCountry => _selectedCountry;

  String? _phoneNumber;
  String? get phoneNumber => _phoneNumber;

  Timer _timer = Timer.periodic(Duration.zero, (timer) {});
  Timer get timer => _timer;

  int _start = 30;
  int get start => _start;

  bool _isResendAgain = false;
  bool get isResendAgain => _isResendAgain;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  LoginProvider() {
    checkLoginUser();
  }

  Future checkLoginUser() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    _isLoggedIn = preferences.getBool('login') ?? false;
    notifyListeners();
  }

  Future setLogin() async {
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool('login', true);
    _isLoggedIn = true;
    notifyListeners();
  }

  void selectCountry(String value) {
    _selectedCountry = value;
    notifyListeners();
  }

  void addPhoneNumber(String value) {
    _phoneNumber = value;
    notifyListeners();
  }

  void resendOTP() {
    _isResendAgain = true;
    const oneSecond = Duration(seconds: 1);
    _timer = Timer.periodic(oneSecond, (timer) {
      if (_start == 0) {
        _start = 60;
        _isResendAgain = false;
        _timer.cancel();
        notifyListeners();
      } else {
        _start--;
        notifyListeners();
      }
    });
    notifyListeners();
  }
}
