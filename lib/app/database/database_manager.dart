import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-06-02 11:38:29
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-04 15:40:32
 * @FilePath: /forcewallet/lib/app/database/database_manager.dart
 * @Description: 
 */

class DataBaseManager {
  static const String mDbName = "forcewallet.db";

  static const String mCreateStoreKeySQL =
      "CREATE TABLE store(id INTEGER PRIMARY KEY, content TEXT)";
  /**
   *   int id = 0;
        int coinType = 0;
        String? showAddress;
        String? originAddress;
        String? balance;
        bool isContract = false;
        String? contractAddress;
   */
  static const String mCreateWalletSQL =
      "CREATE TABLE wallet(id INTEGER PRIMARY KEY, content TEXT)";

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
