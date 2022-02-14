import 'dart:convert';
import 'package:flutter_app/models/contact.dart';
import 'package:flutter_app/models/transferencia.dart';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:sqflite/sqflite.dart';

class LoggingInterceptor implements InterceptorContract {
  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {
    print('url: ${data.url}');
    print('Headers: ${data.headers}');
    print('Body: ${data.body}');
    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    print('Status Code: ${data.statusCode}');
    print('Headers: ${data.headers}');
    print('Body: ${data.body}');
    return data;
  }
}

Future<List<Transferencia>> findAll() async {
  Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);

  final Response response = await client.get(Uri.http(
    '192.168.0.103:8080',
    'transactions',
  ));

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
