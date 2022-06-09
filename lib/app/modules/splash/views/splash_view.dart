import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:forcewallet/app/service/wallet_service.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text(
              'SplashView is working ${controller.content.value}',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
