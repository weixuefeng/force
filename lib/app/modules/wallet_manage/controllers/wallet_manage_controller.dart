import 'package:get/get.dart';

import 'package:forcewallet/app/modules/splash/bindings/splash_binding.dart';
import 'package:forcewallet/app/modules/splash/views/splash_view.dart';
import 'package:forcewallet/app/service/wallet_service.dart';

class WalletManageController extends GetxController {
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

  void clearWallet() async {
    var service = Get.find<WalletService>();
    var res = await service.clear();
    Get.offAll(() => SplashView(), binding: SplashBinding());
  }
}
