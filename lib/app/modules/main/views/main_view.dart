import 'package:flutter/material.dart';
import 'package:forcewallet/app/modules/home/views/home_view.dart';
import 'package:forcewallet/app/modules/setting/views/setting_view.dart';
import 'package:forcewallet/app/utils/extension.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({Key? key}) : super(key: key);

  Widget getWidgetByIndex() {
    if (controller.selectedIndex.value == 0) {
      return HomeView();
    } else if (controller.selectedIndex.value == 2) {
      return SettingView();
    } else {
      return Text('Other');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MainView'),
        centerTitle: true,
      ),
      body: Obx(() => getWidgetByIndex()),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Browser',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: controller.selectedIndex.value,
            selectedItemColor: Color.fromARGB(255, 0, 255, 157),
            onTap: controller.onItemTapped,
          )),
    );
  }
}

/**
 * Column(children: [
        controller.walletInfos.length == 0
            ? Text("data")
            : Column(
                children: [
                  for (var i = 0; i < controller.walletInfos.length; i++)
                    Column(
                      children: [
                        Text(controller.walletInfos[i].coinType.toCoinSymbol()),
                        Text(controller.walletInfos[i].showAddress!),
                        ElevatedButton(
                            onPressed: (() => {
                                  controller.openWalletDetail(
                                      controller.walletInfos[i])
                                }),
                            child: Text("detail"))
                      ],
                    )
                ],
              )
      ])
 */