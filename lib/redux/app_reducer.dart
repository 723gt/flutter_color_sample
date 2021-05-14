import 'app_state.dart';
import './color/color_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(colorState: colorReducer(state.colorState, action));
}
