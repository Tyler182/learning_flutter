import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This stateless widget is the root of application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.indigo[300],
        appBar: AppBar(
          backgroundColor: Colors.indigo[500],
          title: Text("Counter"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Tap "-" to decrement',
                style: TextStyle(color: Colors.white),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: CounterPlusMinus(),
                ),
              ),
              Text(
                'Tap "+" to increment',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CounterPlusMinus extends StatefulWidget {
  //StatefulWidget with counter to be changed
  @override
  State<CounterPlusMinus> createState() => _CounterPlusMinusState();
}

class _CounterPlusMinusState extends State<CounterPlusMinus> {
  //State of StatefullWidhet CounterPlusMinus
  int _counter = 50; // value to be changed after press plus and minus
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          onPressed: () {
            setState(() {
              _counter -= 1; // if pressed "-" button then minus 1
            });
          },
          icon: Icon(Icons.remove),
        ),
        Text(
          _counter.toString(),
          style: TextStyle(fontSize: 26),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              _counter += 1; // if pressed "+" button then minus 1
            });
          },
          icon: Icon(Icons.add),
        ),
      ],
    );
  }
}
