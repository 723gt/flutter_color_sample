import 'package:color_sample/redux/colort/color_state.dart';
import 'package:redux/redux.dart';
import 'package:flutter/material.dart';
import './color_action.dart';

final colorReducer = combineReducers<ColorStaet>([
  TypedReducer<ColorStaet, SetColorAction>(_setColorActionReducer),
]);

ColorStaet _setColorActionReducer(ColorStaet state, SetColorAction action) {
  MaterialColor setColor;
  switch (action) {
    case SetColorAction.blue:
      setColor = Colors.blue;
      break;
    case SetColorAction.green:
      setColor = Colors.green;
      break;
    case SetColorAction.red:
      setColor = Colors.red;
      break;
  }
  return state.copyWith(setColor);
}
