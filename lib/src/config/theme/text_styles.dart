
import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {


  static TextStyle regular({
    double size = 14.0,
    Color color = AppColors.gray,
    TextDecoration decoration = TextDecoration.none
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      decoration: decoration,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle medium({
    double size = 14.0,
    Color color = AppColors.gray,
    TextDecoration decoration = TextDecoration.none
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      decoration: decoration,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }

  static TextStyle semiBold({
    double size = 14.0,
    Color color = AppColors.gray,
    TextDecoration decoration = TextDecoration.none
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      decoration: decoration,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
    );
  }

  static TextStyle bold({
    double size = 14.0,
    Color color = AppColors.gray,
    TextDecoration decoration = TextDecoration.none
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      decoration: decoration,
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }
}