import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './redux/app_state.dart';
import './redux/store.dart';
import './redux/color/color_action.dart';

void main() async {
  final Store<AppState> store = await createStore();
  runApp(MyApp(
    store: store,
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Store<AppState> store;
  MyApp({this.store});
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: store,
      child: StoreConnector<AppState, _ViewModel>(
          converter: (store) => _ViewModel(store.state),
          builder: (context, viewModel) {
            return MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: viewModel.color,
              ),
              home: MyHomePage(title: 'Flutter Demo Home Page'),
            );
          }),
    );
  }
}

class _ViewModel {
  final MaterialColor color;
  _ViewModel(AppState state) : this.color = state.colorState.currentColor;
}

class MyHomePage extends StatelessWidget {
  final String title;
  MyHomePage({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            ElevatedButton(
                onPressed: () {
                  store.dispatch(SetColorAction.blue);
                },
                child: Text("Bule")),
            ElevatedButton(
                onPressed: () {
                  store.dispatch(SetColorAction.green);
                },
                child: Text("Green")),
            ElevatedButton(
                onPressed: () {
                  store.dispatch(SetColorAction.red);
                },
                child: Text("Red")),
          ],
        ),
      ),
    );
  }
}
