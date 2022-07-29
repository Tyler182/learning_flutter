import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "IndieFlower",
      ),
      home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text("Asset and image app"),
          ),
          body: Center(
            child: Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.asset('assets/images/background.jpg'),
                Image.asset('assets/icons/logo.png'),
                Positioned(
                  left: 130,
                  top: 10,
                  child: Text(
                    "My font text",
                    style: TextStyle(
                      fontSize: 30,
                      // fontFamily: "IndieFlower",
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
