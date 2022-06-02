/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 16:13:37
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-02 15:08:24
 * @FilePath: /forcewallet/lib/main.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:forcewallet/page/router.dart';

import 'database/database_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Force Wallet',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Force wallet'),
      onGenerateRoute: onGenerateRoute,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late HDWallet wallet;
  String _content = "";
  bool _active = false;
  List<StoredKey> storeKeys = [];

  @override
  void initState() {
    FlutterTrustWalletCore.init();
    DataBaseManager.init();
    getAllWallets();
    super.initState();
  }

  void getAllWallets() async {
    var res = await DataBaseManager.getAllWallets();
    _handleChangeWallet(res);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times: ${_content}',
            ),
            MaterialButton(
                onPressed: () => {Navigator.pushNamed(context, '/create')},
                child: const Text('Generate Wallet')),
            MaterialButton(
                onPressed: () => {Navigator.pushNamed(context, '/import')},
                child: const Text('Import Wallet')),
          ],
        ),
      ),
    );
  }

  void _handleTap() {
    print("handle tap");
    setState(() {
      _active = !_active;
    });
  }

  void _handleChangeWallet(content) {
    print("_handleChangeWallet tap");
    List<StoredKey> keys = [];
    for (int i = 0; i < content.length; i++) {
      var info = content[i]['content'];
      var key = StoredKey.importJson(info);
      keys.add(key!);
    }
    setState(() {
      _content = content.toString();
      storeKeys = keys;
    });
  }
}
