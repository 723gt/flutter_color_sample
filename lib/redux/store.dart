import 'package:redux/redux.dart';
import 'app_reducer.dart';
import 'app_state.dart';

Future<Store<AppState>> createStore() async {
  return Store(appReducer, initialState: AppState.initial(), middleware: []);
}
