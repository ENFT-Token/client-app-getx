import 'package:enft/app/data/provider/sqflite_api.dart';

class SqfliteRepository {
  final SqfliteApi api;

  SqfliteRepository({required this.api});

  insert(String table, Map<String, dynamic> data) async =>
      await api.insert(table, data);

  update(String table, Map<String, dynamic> data) async =>
      await api.update(table, data);

  updateWhere(String table, Map<String, dynamic> data, String where,
          List whereArgs) async =>
      await api.updateWhere(table, data, where, whereArgs);

  getData(String table) async => await api.getData(table);

  delete() async => await api.delete();
}
