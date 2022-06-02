/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 18:36:04
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-02 15:00:02
 * @FilePath: /forcewallet/lib/page/home.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import '../database/database_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String content = "";

  @override
  void initState() {
    getAllWallets();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (content != "") {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Force Wallet'),
        ),
        body: Center(
          child: Text("No wallet"),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Import Wallet'),
        ),
        body: const Center(
          child: Text('Import Wallet'),
        ),
      );
    }
  }

  void getAllWallets() async {
    var wallets = await DataBaseManager.getAllWallets();
    print(wallets);
    setState(() {
      content:
      wallets.toString();
    });
  }
}
