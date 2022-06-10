import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/object_box.dart';
import 'package:forcewallet/app/database/store_model.dart';

class NetworkManageController extends GetxController {
  var newNetworkConfigList = <NetworkConfig>[].obs;
  var ethNetworkConfigList = <NetworkConfig>[].obs;

  var defaultNewNetworkConfig = NetworkConfig().obs;
  var defaultEthNetworkConfig = NetworkConfig().obs;

  @override
  void onInit() async {
    super.onInit();
    var newConfig = await ObjectBox.queryNetworkConfigByCoinType(
        TWCoinType.TWCoinTypeNewChain);
    var ethConfig = await ObjectBox.queryNetworkConfigByCoinType(
        TWCoinType.TWCoinTypeEthereum);

    /// 不能用 value addAll, 得用 RxList 包裹的操作，才可以通知更新。
    newNetworkConfigList.addAll(newConfig);
    ethNetworkConfigList.addAll(ethConfig);

    defaultNewNetworkConfig.value =
        newConfig.firstWhere((element) => element.isDefault == true);
    defaultEthNetworkConfig.value =
        ethConfig.firstWhere((element) => element.isDefault == true);
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void changeNetworkConfig(
      NetworkConfig networkConfig,
      Rx<NetworkConfig> oldDefaultconfig,
      RxList<NetworkConfig> configList) async {
    if (networkConfig.isDefault == true) {
      return;
    }

    /// 更新内存列表数据
    configList
        .firstWhere((element) => networkConfig.id == element.id)
        .isDefault = true;
    configList
        .firstWhere((element) => oldDefaultconfig.value.id == element.id)
        .isDefault = false;

    /// 更新数据库数据
    networkConfig.isDefault = true;
    oldDefaultconfig.value.isDefault = false;
    await ObjectBox.changeDefaultNetworkConfig(
        networkConfig, oldDefaultconfig.value);

    /// 更新内存 default 数据
    oldDefaultconfig.value = networkConfig;
  }
}
