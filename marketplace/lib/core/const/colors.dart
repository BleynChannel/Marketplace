import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color primaryColor = Color(0xFF8C27B0);
  static const Color accentColor = Color(0xFFDC2492);
  static const Color backgroundColor = Color(0xFF110D14);
  static const Color gradientStartColor = accentColor;
  static const Color gradientStopColor = primaryColor;
  static final Color secondaryColor = const Color(0xFF241D28).withOpacity(0.8);
}
