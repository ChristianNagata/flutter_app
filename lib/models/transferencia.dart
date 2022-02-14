import 'package:flutter_app/models/contact.dart';

class Transferencia {
  final double valor;
  final Contact contact;

  Transferencia(
    this.valor,
    this.contact,
  );

  @override
  String toString() {
    return 'Transferencia{valor: $valor, contact: $contact}';
  }
}
