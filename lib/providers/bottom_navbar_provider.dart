import 'package:flutter/foundation.dart';

class BottomNavBarProvider extends ChangeNotifier {
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;

  void onSelected(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
