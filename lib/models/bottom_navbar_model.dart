import 'package:flutter/material.dart';

class BottomNavBarModel {
  final String label;
  final IconData icon;

  const BottomNavBarModel({required this.label, required this.icon});

  static List<BottomNavBarModel> generatedItem = [
    const BottomNavBarModel(label: 'Home', icon: Icons.home_rounded),
    const BottomNavBarModel(label: 'Schedule', icon: Icons.calendar_month),
    const BottomNavBarModel(label: 'Chat', icon: Icons.chat_rounded),
    const BottomNavBarModel(label: 'Profile', icon: Icons.person_rounded),
  ];
}
