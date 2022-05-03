import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;

class SqfliteApi {
  sql.Database? db;

  SqfliteApi() {
    db = null;
  }

  init(String dbName, String tableName) async {
    final dbPath = await sql.getDatabasesPath();
    this.db = await sql.openDatabase(
      path.join(dbPath, dbName),
      onCreate: (db, version) {
        final stmt = '''CREATE TABLE IF NOT EXISTS $tableName (
            id TEXT AUTO_INCREMENT PRIMARY KEY,
            address TEXT,
            privateKey TEXT
        )'''
            .trim()
            .replaceAll(RegExp(r'[\s]{2,}'), ' ');
        return db.execute(stmt);
      },
      version: 1,
    );
  }

  Future<void> insert(String table, Map<String, dynamic> data) async => await db!
      .insert(table, data, conflictAlgorithm: sql.ConflictAlgorithm.replace);

  Future<List<Map<String, dynamic>>> getData(String table) async =>
      await db!.query(table);

  Future<void> update(String table, Map<String, dynamic> data) async =>
      await db!.update(table, data);

  Future<void> updateWhere(String table, Map<String, dynamic> data,
          String where, List whereArgs) async =>
      await db!.update(table, data, where: where, whereArgs: whereArgs);

  Future<void> delete() async {
    await db!.rawDelete('DELETE FROM user');
  }
}
