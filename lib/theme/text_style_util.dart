import 'package:flutter/material.dart';

TextStyle boldStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.bold,
    height: 1.2,
    decoration: decoration,
    fontFamily: family ?? 'Noto Sans',
  );
}

TextStyle semiBoldStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w600,
    height: 1.2,
    decoration: decoration,
    fontFamily: family ?? 'Noto Sans',
  );
}

TextStyle mediumStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
  double? height,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w500,
    height: height ?? 1.2,
    decoration: decoration,
    fontFamily: family ?? 'Noto Sans',
  );
}

TextStyle normalStyle(
  double size,
  Color color, {
  FontStyle? fontStyle,
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    fontStyle: fontStyle,
    color: color,
    fontWeight: FontWeight.normal,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Noto Sans',
  );
}

TextStyle extraLightStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w200,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Noto Sans',
  );
}

TextStyle lightStyle(
  double size,
  Color color, {
  TextDecoration? decoration,
  String? family,
}) {
  return TextStyle(
    fontSize: size,
    color: color,
    fontWeight: FontWeight.w300,
    height: 1.5,
    decoration: decoration,
    fontFamily: family ?? 'Noto Sans',
  );
}
