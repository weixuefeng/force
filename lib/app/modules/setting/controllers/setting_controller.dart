import 'dart:ui';

import 'package:get/get.dart';

import 'package:forcewallet/app/routes/app_pages.dart';

class SettingController extends GetxController {
  var mCurrentLanguate = "".obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void openWalletManage() {
    Get.toNamed(Routes.WALLET_MANAGE);
  }
}
