import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-06-02 11:38:29
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-02 14:09:37
 * @FilePath: /forcewallet/lib/database/database_manager.dart
 * @Description: 
 */

class DataBaseManager {
  static const String mDbName = "forcewallet.db";
  late Database mInstance;
  static init() async {
    Database _db = await openDatabase(
      join(
        (await getDatabasesPath()),
        mDbName,
      ),
      onCreate: (db, version) {
        db.execute(
          "CREATE TABLE wallets(id INTEGER PRIMARY KEY, content TEXT)",
        );
      },
      version: 1,
    );
  }

  static Future<List<Map<String, dynamic>>> getAllWallets() async {
    Database _db = await openDatabase(
      join(
        (await getDatabasesPath()),
        mDbName,
      ),
    );
    return await _db.rawQuery("SELECT * FROM wallets");
  }

  static Future<int> insertWallet(String storedKey) async {
    Database _db = await openDatabase(
      join(
        (await getDatabasesPath()),
        mDbName,
      ),
    );
    var value = {
      'content': storedKey,
    };
    return await _db.insert(
      'wallets',
      value,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}
