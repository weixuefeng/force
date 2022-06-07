import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  final mStoredWalletInfo = StoredWalletInfo().obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    mStoredWalletInfo.value = Get.arguments;
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openSend() {
    Get.toNamed(Routes.SEND, arguments: mStoredWalletInfo.value);
  }
}
