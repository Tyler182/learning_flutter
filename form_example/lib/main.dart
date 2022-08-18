import 'package:flutter/material.dart';
import 'pages/register_form_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  final rootScaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // home: const RegisterFormPage(),
      home: const RegisterFormPage(),
      scaffoldMessengerKey: rootScaffoldMessengerKey,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ), 
    );
  }
}
