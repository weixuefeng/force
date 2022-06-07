import 'package:flutter/material.dart';
import 'package:forcewallet/app/utils/extension.dart';

import 'package:get/get.dart';

import '../controllers/wallet_controller.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WalletView'),
        centerTitle: true,
      ),
      body: Column(children: [
        Obx(() => Text(
              'Symbol: ${controller.mStoredWalletInfo.value.coinType.toCoinSymbol()}\n\naddress:${controller.mStoredWalletInfo.value.showAddress}',
              style: TextStyle(fontSize: 20),
            )),
        ElevatedButton(onPressed: () => {}, child: Text("transaction history")),
        ElevatedButton(
            onPressed: () => {controller.openSend()},
            child: Text("send transaction")),
        ElevatedButton(onPressed: () => {}, child: Text("receive address")),
      ]),
    );
  }
}
