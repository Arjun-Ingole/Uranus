import 'package:flutter/material.dart';
import 'package:uranus/screens/MainScreen.dart';
import 'package:uranus/screens/ErrorScreen.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ErrorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
