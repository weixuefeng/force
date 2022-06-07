import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/wallet_manage_controller.dart';

class WalletManageView extends GetView<WalletManageController> {
  const WalletManageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WalletManageView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'WalletManageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
