import 'package:flutter/material.dart';
import 'package:flutter_app/screens/transferencia/lista.dart';

void main() {
  runApp(const BytebankApp());
}

class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: ListaTransferencias(),
      debugShowCheckedModeBanner: true,
    );
  }
}