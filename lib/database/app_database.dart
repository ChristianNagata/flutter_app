import 'package:flutter_app/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.tableSQL);
    },
    version: 1,
    // onDowngrade: onDatabaseDowngradeDelete,
    // para deletar os dados: muda para a versão 2 e, juntamente com o onDowngrade, hotrestart. Depois entra na lista, volta para a versão 1 e hotrestart.
  );
}


