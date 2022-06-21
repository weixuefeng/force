import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:forcewallet/app/utils/extension.dart';
import '../controllers/wallet_controller.dart';
import 'package:material_segmented_control/material_segmented_control.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
              Obx(() => Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Text(
                    "${controller.balance.value.toEther()}",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ))),
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
                child: Obx(() => getView())),
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
                    onPressed: () async {
                      int? selectedIndex = await _showCustomModalBottomSheet(
                          context, ['1', '2', '3']);
                      print("自定义底部弹层：选中了第$selectedIndex个选项");
                    },
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

  Future<int?> _showCustomModalBottomSheet(
      context, List<String> options) async {
    return showModalBottomSheet<int>(
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(20.0),
              topRight: const Radius.circular(20.0),
            ),
          ),
          height: MediaQuery.of(context).size.height * 3.0 / 4.0,
          child: Column(children: [
            SizedBox(
              height: 50,
              child: Stack(
                textDirection: TextDirection.rtl,
                children: [
                  Center(
                    child: Text(
                      '底部弹窗',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    ),
                  ),
                  IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      }),
                ],
              ),
            ),
            Divider(height: 1.0),
            Expanded(
                child: ListView(
              children: [
                Center(
                    child: Container(
                        width: 300,
                        margin: const EdgeInsets.only(top: 32),
                        child: QrImage(
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
                ))),
              ],
            )),
          ]),
        );
      },
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
        child: null
      );
    } else {
      return Container(
        margin: const EdgeInsets.only(left: 16, right: 16),
        color: Colors.yellow,
        height: 1200,
        child: null,
      );
    }
  }
}
