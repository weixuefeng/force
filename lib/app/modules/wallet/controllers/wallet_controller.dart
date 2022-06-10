import 'package:forcewallet/app/service/rpc_service.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';

class WalletController extends GetxController {
  final mStoredWalletInfo = StoredWalletInfo().obs;
  var balance = "0".obs;
  late ForceRpcService rpcService;

  @override
  void onInit() {
    super.onInit();
    rpcService = Get.find<ForceRpcService>();
  }

  @override
  void onReady() {
    super.onReady();
    mStoredWalletInfo.value = Get.arguments;
    print(mStoredWalletInfo.value.originAddress);
    rpcService
        .getBalance(mStoredWalletInfo.value.originAddress!,
            mStoredWalletInfo.value.coinType)
        .then((value) => balance.value = value.toString())
        .catchError((error) => {print(error)});
  }

  @override
  void onClose() {
    super.onClose();
  }

  void openSend() {
    Get.toNamed(Routes.SEND, arguments: mStoredWalletInfo.value);
  }
}
