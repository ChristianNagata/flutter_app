import 'package:flutter_app/models/contact.dart';

class Transferencia {
  final double value;
  final Contact contact;

  Transferencia(
    this.value,
    this.contact,
  );

  Transferencia.fromJson(Map<String, dynamic> json) :
      value = json['value'],
      contact = Contact.fromJson(json['contact']);

  Map<String, dynamic> toJson() =>
      {
        'value': value,
        'contact': contact.toJson(),
      };

  @override
  String toString() {
    return 'Transferencia{valor: $value, contact: $contact}';
  }
}
