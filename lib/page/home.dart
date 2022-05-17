/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 18:36:04
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-17 09:10:48
 * @FilePath: /tech_research/forcewallet/lib/page/home.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
