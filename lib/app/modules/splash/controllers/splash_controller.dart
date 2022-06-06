import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:forcewallet/app/database/object_box.dart';
import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  var content = "".obs;

  List<StoredWalletInfo> infos = [];

  @override
  Future<void> onInit() async {
    super.onInit();
    FlutterTrustWalletCore.init();
  }

  @override
  void onReady() {
    super.onReady();
    getAllWallets();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void getAllWallets() async {
    infos = await ObjectBox.queryWallets();
    if (infos.isNotEmpty) {
      Get.toNamed(Routes.HOME, arguments: infos);
    } else {
      Get.toNamed(Routes.CREATE);
    }
  }
}
