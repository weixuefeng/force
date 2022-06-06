import 'package:flutter/material.dart';
import 'package:forcewallet/app/utils/extension.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => Column(children: [
            controller.walletInfos.length == 0
                ? Text("data")
                : Column(
                    children: [
                      for (var i = 0; i < controller.walletInfos.length; i++)
                        Column(
                          children: [
                            Text(controller.walletInfos[i].coinType
                                .toCoinSymbol()),
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
          ])),
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