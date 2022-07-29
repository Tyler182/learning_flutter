import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyStatefulWidget());

class MyStatefulWidget extends StatefulWidget {
  @override
  State<MyStatefulWidget> createState() {
    return _MyStatefulWidgetState();
  }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _loading = false;
  double _progressValue = 0.0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo,
        appBar: AppBar(
          centerTitle: true,
          title: Text("Download page"),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: _loading
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      LinearProgressIndicator(
                          value: _progressValue, color: Colors.blue),
                      Text(
                        "${(_progressValue * 100).round()}%",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      Text(
                        "Downloading in progress",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  )
                : Text(
                    "Press to download",
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.cloud),
          onPressed: () {
            setState(() {
              _loading = !_loading;
              _progressValue = 0.0;
              _updateProgress();
            });
          },
        ),
      ),
    );
  }

  void _updateProgress() {
    Duration oneSec = Duration(seconds: 1);
    Timer.periodic(oneSec, (timer) {
      setState(() {
        _progressValue += 0.2;
      });
      if (_progressValue >= 1) {
        setState(() {
          _loading = false;
          _progressValue = 0.0;
        });
        timer.cancel();
        return;
      }
      ;
    });
  }
}
