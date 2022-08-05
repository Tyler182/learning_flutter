import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key}) : super(key: key);
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  TextEditingController textFieldController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Screen'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              controller: textFieldController,
            ),
            ElevatedButton(
              onPressed: (() {
                String textToSendBack = textFieldController.text;
                Navigator.pop(context, textToSendBack);
              }),
              child: const Text(
                'Go back to First Screen',
              ),
            )
          ],
        ),
      ),
    );
  }
}
