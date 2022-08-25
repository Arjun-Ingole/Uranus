import 'package:flutter/material.dart';
import 'package:uranus/services/getData.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GetData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
