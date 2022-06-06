import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<StoredWalletInfo> walletInfos = <StoredWalletInfo>[].obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    var a = Get.arguments as List<StoredWalletInfo>;
    a.forEach((element) {
      walletInfos.add(element);
    });
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openWalletDetail(StoredWalletInfo info) {
    Get.toNamed(Routes.WALLET, arguments: info);
  }
}
