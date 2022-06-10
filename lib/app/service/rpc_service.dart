import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:forcewallet/app/database/object_box.dart';
import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/network/rpc_ethereum.dart';
import 'package:get/get.dart';

class ForceRpcService extends GetxService {
  RpcEthereum? newRpcService;
  RpcEthereum? ethRpcService;

  Future<void> initRpcService() async {
    var newNetworkConfig = await ObjectBox.queryDefaultNetworkConfigByCoinType(
        TWCoinType.TWCoinTypeNewChain);
    var ethNetworkConfig = await ObjectBox.queryDefaultNetworkConfigByCoinType(
        TWCoinType.TWCoinTypeEthereum);

    newRpcService = RpcEthereum(newNetworkConfig.rpcUrl!);
    ethRpcService = RpcEthereum(ethNetworkConfig.rpcUrl!);
  }

  Future<BigInt?> getBalance(String address, int cointType) async {
    if (cointType == TWCoinType.TWCoinTypeNewChain) {
      return await newRpcService!.getBalance(address);
    } else {
      return await ethRpcService!.getBalance(address);
    }
  }

  void updateRpcService(NetworkConfig networkConfig) {
    if (networkConfig.coinType == TWCoinType.TWCoinTypeNewChain) {
      newRpcService = RpcEthereum(networkConfig.rpcUrl!);
    } else {
      ethRpcService = RpcEthereum(networkConfig.rpcUrl!);
    }
  }
}
