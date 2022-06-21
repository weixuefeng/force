import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:forcewallet/app/service/wallet_service.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: null,
        body: Center(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          child: Obx(() => Image(
            image: AssetImage("images/splash.jpg"),
            fit: BoxFit.cover,
            semanticLabel: '${controller.content.value}',
          )),
        ));
  }
}
