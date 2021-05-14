import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import './colort/color_state.dart';

@immutable
class AppState {
  final ColorStaet colorState;
  AppState({this.colorState});
  factory AppState.initial() {
    return AppState(colorState: ColorStaet.initial());
  }

  AppState copyWith({ColorStaet colorState}) {
    AppState(colorState: colorState ?? this.colorState);
  }
}
