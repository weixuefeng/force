import 'package:forcewallet/app/database/object_box.dart';
import 'package:forcewallet/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

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

  clearWallet() async {
    var res = await ObjectBox.clear();
    Get.off(() => SplashView());
  }
}
