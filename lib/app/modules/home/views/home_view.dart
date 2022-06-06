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
        body: Column(children: [
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
                              onPressed: (() => {print("open detail")}),
                              child: Text("detail"))
                        ],
                      )
                  ],
                )
        ]));
  }
}
