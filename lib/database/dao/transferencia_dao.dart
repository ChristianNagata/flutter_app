import 'package:flutter_app/models/transferencia.dart';
import 'package:sqflite/sqflite.dart';
import '../app_database.dart';

class TransferenciaDao {
  static const String tableSQL =
      'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER, '
      '$_value DOUBLE)';

  static const String _tableName = 'transferencias';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';
  static const String _value = 'value';

  Future<int> saveTransferencia(Transferencia transferencia) async {
    final Database db = await getDatabase();
    Map<String, dynamic> transferenciaMap = _toMap(transferencia);
    return db.insert(_tableName, transferenciaMap);
  }

  Map<String, dynamic> _toMap(Transferencia transferencia) {
    final Map<String, dynamic> transferenciaMap = {};
    transferenciaMap[_name] = transferencia.nomeRecebedor;
    transferenciaMap[_accountNumber] = transferencia.numeroConta;
    transferenciaMap[_value] = transferencia.valor;
    return transferenciaMap;
  }

  Future<List<Transferencia>> findAllTransferencias() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Transferencia> transferencias = _toList(result);
    return transferencias;
  }

  List<Transferencia> _toList(List<Map<String, dynamic>> result) {
    final List<Transferencia> transferencias = [];
    for (Map<String, dynamic> row in result) {
      final Transferencia transferencia = Transferencia(
        row[_name],
        row[_value],
        row[_accountNumber],
      );
      transferencias.add(transferencia);
    }
    return transferencias;
  }
}