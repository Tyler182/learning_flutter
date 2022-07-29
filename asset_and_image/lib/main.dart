import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text("Asset and image app"),
          ),
          body: Center(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset('assets/images/background.jpg'),
                Image.asset('assets/icons/logo.png'),
              ],
            ),
          )),
    );
  }
}
