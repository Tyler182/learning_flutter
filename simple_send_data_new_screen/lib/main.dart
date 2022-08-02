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
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    User user = User(name: 'Alex', age: 30);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: ElevatedButton(
        child: const Center(
          child: Text('Press to Page 2'),
        ),
        onPressed: () {
          //on press jump to page2
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Page2(user: user)),
          );
        },
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  // const Page2({Key? key}) : super(key: key);
  final User? user;
  Page2({this.user});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('${this.user?.name}')),
        body: ElevatedButton(
          child: const Center(
            child: Text('Back to Page 1'),
          ),
          onPressed: () {
            //on press jump back to page1
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class User {
  String? name;
  double? age;
  User({this.name, this.age});
}
