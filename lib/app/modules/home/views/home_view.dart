import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/modules/home/controllers/home_controller.dart';
import 'package:forcewallet/app/utils/extension.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 20),
              child: CarouselSlider(
                options: CarouselOptions(
                    autoPlay: false,
                    enlargeCenterPage: true,
                    aspectRatio: 2.0,
                    enableInfiniteScroll: false,
                    onPageChanged: (index, reason) {
                      controller
                          .setCurrentWalletId(controller.storedInfos[index].id);
                    }),
                items: controller.storedInfos.map((info) {
                  return _buildPageItem(info);
                }).toList(),
              ),
            ),
            Container(
              height: 200,
              margin: const EdgeInsets.only(top: 20),
              child: Obx(() => ListView(
                    children: controller.walletInfoMap[
                                controller.mCurrentWalletId.value] ==
                            null
                        ? [Text("error data")]
                        : controller
                            .walletInfoMap[controller.mCurrentWalletId.value]!
                            .map((element) => _buildWalletItem(element))
                            .toList(),
                  )),
            )
          ],
        ));
  }

  Widget _buildPageItem(StoredKeyInfo info) {
    final id = info.id.toString();
    return Card(
      color: Colors.blueAccent,
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      clipBehavior: Clip.antiAlias,
      semanticContainer: false,
      child: Container(
        width: 400,
        height: 100,
        child: Center(
          child: Text(
            'Wallet $id',
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
