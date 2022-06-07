import 'package:flutter/material.dart';
import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/modules/home/controllers/home_controller.dart';
import 'package:forcewallet/app/utils/extension.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            child: Obx(() => PageView.builder(
                  onPageChanged: (value) {
                    controller
                        .setCurrentWalletId(controller.storedInfos[value].id);
                  },
                  itemBuilder: (context, index) => _buildPageItem(index),
                  itemCount: controller.storedInfos.length,
                ))),
        Container(
          height: 200,
          child: Obx(() => ListView(
                children: controller
                            .walletInfoMap[controller.mCurrentWalletId.value] ==
                        null
                    ? [Text("error data")]
                    : controller
                        .walletInfoMap[controller.mCurrentWalletId.value]!
                        .map((element) => _buildWalletItem(element))
                        .toList(),
              )),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Card(
      color: Colors.blueAccent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: Container(
        width: 200,
        height: 100,
        child: Center(
          child: Text(
            '$index',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }

  Widget _buildWalletItem(StoredWalletInfo element) {
    return Container(
      child: Column(
        children: [
          Text(element.coinType.toCoinSymbol()),
          Text(element.showAddress!),
          ElevatedButton(
              onPressed: (() => {controller.openWalletDetail(element)}),
              child: Text("Open"))
        ],
      ),
    );
  }
}
