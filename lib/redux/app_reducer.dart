import 'app_state.dart';
import './colort/color_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(colorState: colorReducer(state.colorState, action));
}
