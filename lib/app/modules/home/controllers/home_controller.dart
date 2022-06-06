import 'package:forcewallet/app/database/store_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<StoredWalletInfo> walletInfos = <StoredWalletInfo>[].obs;
  var content = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    var a = Get.arguments;
    walletInfos.value.addAll(a);
  }

  @override
  void onClose() {
    super.onClose();
  }
}
