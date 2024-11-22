
import 'package:flutter/material.dart';
import 'app_colors.dart';

class TextStyles {

  static TextStyle regularTitle({
    double size = 20.0,
    Color color = Colors.black,
    TextDecoration decoration = TextDecoration.none
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      decoration: decoration,
      letterSpacing: 0.3,
      fontFamily: 'PublicoHeadline',
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle regular({
    double size = 14.0,
    Color color = AppColors.gray,
    TextDecoration decoration = TextDecoration.none
  }) {
    return TextStyle(
      fontSize: size,
      color: color,
      decoration: decoration,
      fontFamily: 'IBMPlexSans',
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
      fontFamily: 'IBMPlexSans',
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
      fontFamily: 'IBMPlexSans',
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
      fontFamily: 'IBMPlexSans',
      fontWeight: FontWeight.w700,
    );
  }
}