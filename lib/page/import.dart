/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 18:36:04
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-16 19:02:43
 * @FilePath: /tech_research/forcewallet/lib/page/import.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

class ImportWalletPage extends StatefulWidget {
  const ImportWalletPage({Key? key}) : super(key: key);

  @override
  State<ImportWalletPage> createState() => _CreateImportState();
}

class _CreateImportState extends State<ImportWalletPage> {
  @override
  void initState() {
    print("init import");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
