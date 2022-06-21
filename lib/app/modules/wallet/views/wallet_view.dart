import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forcewallet/app/utils/extension.dart';
import '../controllers/wallet_controller.dart';
import 'package:material_segmented_control/material_segmented_control.dart';

class WalletView extends GetView<WalletController> {
  const WalletView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    const info = {
      "NEW": {"name": "Newton", "icon": "images/new.png"},
      "ETH": {"name": "Ethereum", "icon": "images/eth.png"}
    };
    Map<int, Widget> _children = {
      0: Text('活动'),
      1: Text('关于'),
      2: Text('工具'),
    };

    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Obx(() => Text(
                '${controller.mStoredWalletInfo.value.coinType.toCoinSymbol()}',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ))),
            Obx(() => Text(
                '${info[controller.mStoredWalletInfo.value.coinType.toCoinSymbol()]?["name"]}',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 10,
                ))),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        foregroundColor: Colors.black,
      ),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child: ListView(
          children: [
            Center(
                child: SingleChildScrollView(
                    child: Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 32),
                  width: 48,
                  child: Obx(() => Image(
                      image: AssetImage(
                          '${info[controller.mStoredWalletInfo.value.coinType.toCoinSymbol()]?["icon"] ?? "images/new.png"}')))),
              Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Text(
                    "${controller.balance}",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 4),
                  child: Text(
                    "¥0.00",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  )),
            ]))),
            Container(
                margin: const EdgeInsets.only(top: 32),
                child: Obx(() => MaterialSegmentedControl(
                      children: _children,
                      selectionIndex: controller.selectedSegment.value,
                      borderColor: Colors.white,
                      selectedColor: Colors.redAccent,
                      unselectedColor: Colors.white,
                      borderRadius: 0,
                      onSegmentChosen: (index) {
                        if (index is int && index != null) {
                          controller.onSegmentSelect(index.toInt());
                        }
                      },
                    ))),
            Container(
              margin: const EdgeInsets.only(top: 16),
              child: Obx(() =>
                getView()
              )
            ),
            // ElevatedButton(
            //     onPressed: () => {}, child: Text("transaction history")),
          ],
        )),
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              height: 48,
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                  ),
                  onPressed: () => {controller.openSend()},
                  child: Text(
                    "转账",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  )),
            ),
            Container(
                width: 150,
                height: 48,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.blue[300]),
                    ),
                    onPressed: () => {},
                    child: Text(
                      "收款",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ))),
          ],
        ),
      ]),
    );
  }

  Widget getView() {
    if (controller.selectedSegment == 0) {
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        color: Colors.red,
        height: 200,
        child: null,
      );
    } else if (controller.selectedSegment == 1) {
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        color: Colors.blue,
        height: 800,
        child: null,
      );
    } else  {
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        color: Colors.yellow,
        height: 1200,
        child: null,
      );
    }
  }
}
