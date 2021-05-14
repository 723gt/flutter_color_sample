import 'package:flutter/material.dart';

class ColorStaet {
  final MaterialColor currentColor;
  ColorStaet({this.currentColor});
  factory ColorStaet.initial() => ColorStaet(currentColor: Colors.blue);

  ColorStaet copyWith(MaterialColor color) {
    return ColorStaet(currentColor: color ?? this.currentColor);
  }
}
