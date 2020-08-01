import 'package:flutter/material.dart';
import 'package:saksham_kisan/sign_in.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saksham Kisan',

      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        fontFamily:'Balthazar',
        primarySwatch: Colors.blue,
      ),
      home: LoginPage()
    );
  }
}
