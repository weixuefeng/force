/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 16:13:37
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-17 18:21:10
 * @FilePath: /forcewallet/lib/main.dart
 * @Description: 
 */
import 'package:flutter/material.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:forcewallet/page/router.dart';

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

  @override
  void initState() {
    FlutterTrustWalletCore.init();
    super.initState();
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
            MaterialButton(
                onPressed: () => {Navigator.pushNamed(context, '/create')},
                child: const Text('Generate Wallet')),
            MaterialButton(
                onPressed: () => {Navigator.pushNamed(context, '/import')},
                child: const Text('Import Wallet'))
          ],
        ),
      ),
    );
  }
}
