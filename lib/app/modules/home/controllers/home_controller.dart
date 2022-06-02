import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<StoredKey> storeKeys = [];
  var content = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    storeKeys = Get.arguments;
    StoredKey storeKey = storeKeys[0];
    var count = storeKey.accountCount();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
