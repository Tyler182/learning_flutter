import 'package:flutter/material.dart';

void main() => runApp(MyStateLessWidget());

class MyStateLessWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          title: Text("Download page"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(value: 0.4, color: Colors.blue),
                Text(
                  "40%",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                Text(
                  "Downloading in progress",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
