import 'dart:convert';
import 'package:flutter_app/http/webclient.dart';
import 'package:http/http.dart';
import '../../models/transferencia.dart';

class TransactionWebClient {
  Future<List<Transferencia>> findAll() async {
    final Response response = await client
        .get(Uri.http('192.168.0.103:8080', 'transactions'))
        .timeout(const Duration(seconds: 5));

    final List<dynamic> decodeJson = jsonDecode(response.body);
    return decodeJson
        .map((dynamic json) => Transferencia.fromJson(json))
        .toList();
  }

  Future<Transferencia> save(Transferencia transaction) async {
    final String transactionJson = jsonEncode(transaction.toJson());

    final Response response = await client.post(
        Uri.http('192.168.0.103:8080', 'transactions'),
        headers: {'Content-type': 'application/json', 'password': '1000'},
        body: transactionJson);

    return Transferencia.fromJson(jsonDecode(response.body));
  }
}
