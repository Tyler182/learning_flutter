import 'package:flutter/material.dart';

void main() {
  // ignore: prefer_const_constructors
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/page2': ((context) => Page2()),
      },
      initialRoute: '/',
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: ElevatedButton(
        child: const Center(
          child: Text('Press to Page 2'),
        ),
        onPressed: () { //on press jump to page2
          Navigator.pushNamed(context, '/page2');
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Page 2')),
        body: ElevatedButton(
          child: const Center(
            child: Text('Back to Page 1'),
          ),
          onPressed: () { //on press jump back to page1
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
