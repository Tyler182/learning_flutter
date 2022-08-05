import 'package:flutter/material.dart';
import 'package:returned_pass_data/second_screen.dart';

// ignore: unused_import
import 'dart:async';

class FirstScreen extends StatefulWidget {
  const FirstScreen({Key? key}) : super(key: key);
  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  String text = 'Any text';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fisrt screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(text),
            ElevatedButton(
              onPressed: (() {
                _returnDataFromSecondScreen(context);
              }),
              child: const Text('Press to Second Screen'),
            )
          ],
        ),
      ),
    );
  }
  
  void _returnDataFromSecondScreen(BuildContext context) async {
  MaterialPageRoute route = MaterialPageRoute(
    builder: ((context) => const SecondScreen()),
  );
  var result = await Navigator.push(context, route);
  setState(() {text =  result;});
  }
}
