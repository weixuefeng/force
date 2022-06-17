import 'package:convert/convert.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:forcewallet/app/modules/scan/bindings/scan_binding.dart';
import 'package:forcewallet/app/modules/scan/views/scan_view.dart';
import 'package:forcewallet/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:web3dart/web3dart.dart';

import 'package:forcewallet/app/constant/constant.dart';
import 'package:forcewallet/app/database/object_box.dart';
import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/network/rpc_ethereum.dart';
import 'package:forcewallet/app/utils/extension.dart';

import 'package:flutter_trust_wallet_core/protobuf/Ethereum.pb.dart'
    as Ethereum;

class SendController extends GetxController {
  final targetAddress = "".obs;
  final targetAmount = "".obs;
  final mPassword = "".obs;
  final mStoredWalletInfo = StoredWalletInfo().obs;
  final mAddressInputController = TextEditingController().obs;

  var rpc = RpcEthereum(NewChainTest);

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    mStoredWalletInfo.value = Get.arguments;
    print("address: ${mStoredWalletInfo.value.originAddress}");
  }

  @override
  void onClose() {
    super.onClose();
  }

  void updateAddress(String address) {
    targetAddress.value = address;
  }

  void updateAmount(String amount) {
    targetAmount.value = amount;
  }

  void updatePassword(String password) {
    mPassword.value = password;
  }

  void openScan() async {
    var data = await Get.to(ScanQRView(), binding: ScanBinding());
    mAddressInputController.value.text = data;
  }

  void sendTransaction() {
    try {
      var walletInfo = mStoredWalletInfo.value;
      if (walletInfo.coinType == TWCoinType.TWCoinTypeNewChain) {
        _sendNEW();
      } else if (walletInfo.coinType == TWCoinType.TWCoinTypeEthereum) {
        _sendETH();
      } else {
        print("current not support ${walletInfo.coinType}");
      }
    } catch (e) {
      print(e);
    }
  }

  void _sendNEW() async {
    // get estamated fee
    var count =
        await rpc.getTransactionCount(mStoredWalletInfo.value.originAddress!);
    var gasPrice = await rpc.gasPrice();
    var gasLimit = await rpc.estimateGas(
        fromAddress: mStoredWalletInfo.value.originAddress!,
        toAddress: targetAddress.value,
        value:
            EtherAmount.fromUnitAndValue(EtherUnit.ether, targetAmount.value));
    // input password
    var storedInfo =
        await ObjectBox.queryStoredinfo(mStoredWalletInfo.value.parentId);
    var storeKey = StoredKey.importJson(storedInfo.text!);

    var mnemonic = storeKey!.decryptMnemonic(mPassword.value.utf8Encode());
    print("mnemonic: ${mnemonic.toString()}");

    var hdWallet = HDWallet.createWithMnemonic(mnemonic!);
    var privateKey =
        hdWallet.getKeyForCoin(TWCoinType.TWCoinTypeNewChain).data();

    Ethereum.SigningInput input = Ethereum.SigningInput(
        chainId: 1007.toUint8List(),
        nonce: count.toUint8List(),
        gasPrice: gasPrice!.toUint8List(),
        gasLimit: (gasLimit).toUint8List(),
        maxFeePerGas: gasPrice.toUint8List(),
        maxInclusionFeePerGas: gasPrice.toUint8List(),
        toAddress: targetAddress.value,
        privateKey: hex.encode(privateKey).toUint8List(),
        transaction: Ethereum.Transaction(
            transfer: Ethereum.Transaction_Transfer(
                amount: EtherAmount.fromUnitAndValue(
                        EtherUnit.ether, targetAmount.value)
                    .getValueInUnitBI(EtherUnit.wei)
                    .toUint8List())));
    final output = Ethereum.SigningOutput.fromBuffer(
        AnySigner.sign(input.writeToBuffer(), TWCoinType.TWCoinTypeNewChain)
            .toList());
    var res = await rpc.mWeb3Client
        .sendRawTransaction(hex.encode(output.encoded.toList()).toUint8List());
    print("res: ${res}");
  }

  void _sendETH() {}
}
