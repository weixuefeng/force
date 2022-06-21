import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:forcewallet/app/utils/extension.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
              'Symbol: ${controller.mStoredWalletInfo.value.coinType.toCoinSymbol()}\n\naddress:${controller.mStoredWalletInfo.value.showAddress?.toNEWAddress(1012)}',
              style: TextStyle(fontSize: 20),
            )),
        Obx(() => Text(
              'Balance: ${controller.balance}',
              style: TextStyle(fontSize: 20),
            )),
        ElevatedButton(onPressed: () => {}, child: Text("transaction history")),
        ElevatedButton(
            onPressed: () => {controller.openSend()},
            child: Text("send transaction")),
        QrImage(
          data:
              '${controller.mStoredWalletInfo.value.showAddress?.toNEWAddress(1007)}',
          version: QrVersions.auto,
          size: 320,
          gapless: false,
          errorStateBuilder: (cxt, err) {
            return Container(
              child: Center(
                child: Text(
                  "Uh oh! Something went wrong...",
                  textAlign: TextAlign.center,
                ),
              ),
            );
          },
        ),
        ElevatedButton(
            onPressed: () => {
                  Get.defaultDialog(
                      title: '提示',
                      content: QrImage(
                        data: 'This QR code will show the error state instead',
                        version: 1,
                        size: 320,
                        gapless: false,
                        errorStateBuilder: (cxt, err) {
                          return Container(
                            child: Center(
                              child: Text(
                                "Uh oh! Something went wrong...",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          );
                        },
                      ))
                },
            child: Text("receive address")),
      ]),
    );
  }
}
