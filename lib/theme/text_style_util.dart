import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle boldStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? height,
}) {
  return GoogleFonts.manrope(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.bold,
    height: height ?? 1.2,
    decoration: decoration,
  );
}

TextStyle semiBoldStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? height,
}) {
  return GoogleFonts.manrope(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w600,
    height: height ?? 1.2,
    decoration: decoration,
  );
}

TextStyle mediumStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? height,
}) {
  return GoogleFonts.manrope(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w500,
    height: height ?? 1.2,
    decoration: decoration,
  );
}

TextStyle normalStyle(
  double size,
  Color color, {
  FontStyle? fontStyle,
  TextDecoration? decoration,
  String? family,
  double? height,
}) {
  return GoogleFonts.manrope(
    fontSize: size,
    fontStyle: fontStyle,
    color: color,
    fontWeight: FontWeight.normal,
    height: height ?? 1.5,
    decoration: decoration,
  );
}

TextStyle extraLightStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? height,
}) {
  return GoogleFonts.manrope(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w200,
    height: height ?? 1.5,
    decoration: decoration,
  );
}

TextStyle lightStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? height,
}) {
  return GoogleFonts.manrope(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w300,
    height: height ?? 1.5,
    decoration: decoration,
  );
}
