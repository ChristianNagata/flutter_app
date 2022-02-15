
import 'dart:convert';

import 'package:flutter_app/http/webclient.dart';
import 'package:flutter_app/models/contact.dart';
import 'package:http/http.dart';

import '../../models/transferencia.dart';

class TransactionWebClient {
  Future<List<Transferencia>> findAll() async {
    final Response response = await client
        .get(Uri.http(
      '192.168.0.103:8080',
      'transactions'
    ))
        .timeout(const Duration(seconds: 5));

    List<Transferencia> transactions = _toTransactions(response);
    return transactions;
  }

  List<Transferencia> _toTransactions(Response response) {
    final List<dynamic> decodeJson = jsonDecode(response.body);
    final List<Transferencia> transactions = [];
    for (Map<String, dynamic> element in decodeJson) {
      final Transferencia transaction = Transferencia(
        element['value'],
        Contact(
          0,
          element['contact']['name'],
          element['contact']['accountNumber'],
        ),
      );
      transactions.add(transaction);
    }
    return transactions;
  }

  Future<Transferencia> save(Transferencia transaction) async {
    Map<String, dynamic> transactionMap = _toMap(transaction);
    final String transactionJson = jsonEncode(transactionMap);

    final Response response = await client.post(
        Uri.http('192.168.0.103:8080', 'transactions'),
        headers: {'Content-type': 'application/json', 'password': '1000'},
        body: transactionJson
    );

    return _toTransaction(response);
  }

  Transferencia _toTransaction(Response response) {
    Map<String, dynamic> json = jsonDecode(response.body);
    return Transferencia(
      json['value'],
      Contact(
        0,
        json['contact']['name'],
        json['contact']['accountNumber'],
      ),
    );
  }

  Map<String, dynamic> _toMap(Transferencia transaction) {
    final Map<String, dynamic> transactionMap = {'value': transaction.valor,
      'contact': {
        'name': transaction.contact.name,
        'accountNumber': transaction.contact.accountNumber,
      }
    };
    return transactionMap;
  }

}