import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color appThemeColor = Color(0xFF03BF9C);
}

class AppTextTheme {
  static const Color appTextThemeDark = Color(0xFF0A0A0A);
  static const Color appTextThemeLight = Color(0xFF8F8F8F);
  static const Color appTextThemeError = Color(0xFFf44336);
}

class AppIconTheme {
  static const Color appIconThemeDark = Color(0xFF141414);
  static const Color appIconThemeLight = Color(0xFFA3A3A3);
}

class AppDefaultTheme {
  static const Color appDefaultTheme = Color(0xFFF5F5F5);
}

class AppTextStyle {
  static get fontFamily => GoogleFonts.poppins().fontFamily;

  static TextStyle h0TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w800,
      double size = 24.0}) {
    return GoogleFonts.poppins(
        fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle h1TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w700,
      double size = 20.0}) {
    return GoogleFonts.poppins(
        fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle h2TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w600,
      double size = 18.0}) {
    return GoogleFonts.poppins(
        fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle h3TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w500,
      double size = 16.0}) {
    return GoogleFonts.poppins(
        fontSize: size, fontWeight: fontWeight, color: color);
  }

  static TextStyle h4TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w400,
      double? wordSpacing,
      double size = 14.0}) {
    return GoogleFonts.poppins(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        wordSpacing: wordSpacing);
  }

  static TextStyle h5TextStyle(
      {Color color = AppTextTheme.appTextThemeDark,
      FontWeight fontWeight = FontWeight.w500,
      double size = 12.0}) {
    return GoogleFonts.poppins(
        fontSize: size, fontWeight: fontWeight, color: color);
  }
}

class AppBoxShadow {
  static BoxShadow s0BoxShadow(
      {Color color = Colors.black, double blurRadius = 14.0}) {
    return BoxShadow(
      color: color,
      blurRadius: blurRadius,
      spreadRadius: 0.0,
    );
  }

  static BoxShadow s1BoxShadow(
      {Color color = Colors.black,
      double blurRadius = 14.0,
      double x = 0.0,
      double y = 0.0}) {
    return BoxShadow(
        spreadRadius: 0.0,
        color: color,
        blurRadius: blurRadius,
        offset: Offset(x, y));
  }
}
