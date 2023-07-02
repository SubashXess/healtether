import 'package:flutter/material.dart';
import 'package:healtether/utilities/navigators.dart';

import '../constants/themes.dart';
import '../pages/schedulepage/schedulepage.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      elevation: 0.0,
      width: 240.0,
      child: SafeArea(
        child: Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerItem(
                  icon: Icons.home_rounded,
                  label: 'Home',
                  onTap: () => onItemPressed(context, 0),
                ),
                DrawerItem(
                  icon: Icons.access_time_filled_rounded,
                  label: 'Schedule',
                  onTap: () => onItemPressed(context, 1),
                ),
                DrawerItem(
                  icon: Icons.chat_rounded,
                  label: 'WhatsApp',
                  onTap: () => onItemPressed(context, 2),
                ),
                DrawerItem(
                  icon: Icons.volume_up_rounded,
                  label: 'Marketing',
                  onTap: () => onItemPressed(context, 3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, int index) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        // navigatorPush(context, HomePage());
        // Navigator.pop(context);
        break;
      case 1:
        navigatorPush(context, const SchedulePage());
        break;
      case 2:
        // navigatorPush(context, WhatsappPage());
        break;
      case 3:
        // navigatorPush(context, MarketingPage());
        break;
      default:
        Navigator.pop(context);
        break;
    }
  }
}

class DrawerItem extends StatelessWidget {
  const DrawerItem({
    super.key,
    required this.onTap,
    required this.icon,
    required this.label,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 16.0),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.0,
              color: Colors.black54,
            ),
            const SizedBox(width: 10.0),
            Text(label,
                style: AppTextStyle.h4TextStyle(
                    color: Colors.black87, size: 15.0)),
          ],
        ),
      ),
    );
  }
}
