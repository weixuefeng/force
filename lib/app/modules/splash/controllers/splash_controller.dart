import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/modules/create/bindings/create_binding.dart';
import 'package:forcewallet/app/modules/create/views/create_view.dart';
import 'package:forcewallet/app/modules/main/bindings/main_binding.dart';
import 'package:forcewallet/app/modules/main/views/main_view.dart';
import 'package:forcewallet/app/service/wallet_service.dart';

class SplashController extends GetxController {
  var content = "".obs;

  List<StoredWalletInfo> infos = [];

  @override
  Future<void> onInit() async {
    print("onInit");
    super.onInit();
    FlutterTrustWalletCore.init();
  }

  @override
  void onReady() {
    super.onReady();
    print("onReady");
    Future.delayed(Duration(milliseconds: 2000), () {
      getAllWallets();
    });
  }

  @override
  void onClose() {
    super.onClose();
    print("onClose");
  }

  void getAllWallets() async {
    var service = Get.find<WalletService>();
    await service.initData();
    var isEmptyWallet = service.mWalletInfos.value.isEmpty;
    if (isEmptyWallet) {
      Get.off(() => CreateView(),
          preventDuplicates: false, binding: CreateBinding());
    } else {
      Get.off(() => MainView(),
          preventDuplicates: false, binding: MainBinding());
    }
  }
}
