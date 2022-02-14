import 'package:flutter/material.dart';
import 'package:flutter_app/screens/dashboard.dart';
import 'http/webclient.dart';

void main() {
  runApp(const BytebankApp());
  findAll().then((trasactions) => print('New transactions: $trasactions'));
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
      home: const Dashboard(),
      debugShowCheckedModeBanner: true,
    );
  }
}
