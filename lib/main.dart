import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboard.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.green,
        backgroundColor: Colors.green,
      ),
      home: Dashboard(),
      debugShowCheckedModeBanner: true,
    );
  }
}
