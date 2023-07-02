import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badge;
import '../constants/themes.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.size,
    this.backgroundColor = AppTheme.appThemeColor,
    this.labelColor = Colors.white,
    required this.label,
    this.bordered = false,
    required this.onTap,
  });

  final Size size;
  final Color backgroundColor;
  final Color labelColor;
  final String label;
  final bool bordered;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: Container(
        width: size.width,
        height: 45.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: bordered ? null : backgroundColor,
          border:
              bordered ? Border.all(color: backgroundColor, width: 1.0) : null,
          boxShadow: bordered
              ? null
              : [
                  AppBoxShadow.s0BoxShadow(
                      color: Colors.black.withOpacity(0.056))
                ],
        ),
        child: Center(
          child: Text(label,
              style: AppTextStyle.h4TextStyle(
                  color: labelColor, fontWeight: FontWeight.w500)),
        ),
      ),
    );
  }
}

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onTap,
    this.size = 36.0,
    required this.icon,
    this.badgeShow = false,
    this.badgeLabel,
    this.borderColor = Colors.black26,
    this.iconColor = Colors.black87,
  });

  final VoidCallback onTap;
  final double size;
  final IconData icon;
  final bool badgeShow;
  final String? badgeLabel;
  final Color borderColor;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: onTap,
      child: badge.Badge(
        showBadge: badgeShow,
        position: badge.BadgePosition.topEnd(end: 0, top: -6.0),
        badgeStyle: const badge.BadgeStyle(
          badgeColor: Colors.red,
          padding: EdgeInsets.all(5.0),
          elevation: 0.0,
        ),
        badgeContent: Text(
          '2',
          style: AppTextStyle.h4TextStyle(
              color: Colors.white, size: 10.0, fontWeight: FontWeight.w500),
        ),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            border: Border.all(width: 1.0, color: borderColor),
          ),
          child: Icon(
            icon,
            size: 22.0,
            color: iconColor,
          ),
        ),
      ),
    );
  }
}
