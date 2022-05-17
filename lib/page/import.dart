/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 18:36:04
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-17 11:22:55
 * @FilePath: /forcewallet/lib/page/import.dart
 * @Description: 
 */
import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';

class ImportWalletPage extends StatefulWidget {
  const ImportWalletPage({Key? key}) : super(key: key);

  @override
  State<ImportWalletPage> createState() => _CreateImportState();
}

class _CreateImportState extends State<ImportWalletPage> {
  final TextEditingController _mInputContentController =
      TextEditingController();

  @override
  void initState() {
    // _unameController.addListener(() {
    //   print(_unameController.text);
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import Wallet'),
      ),
      body: Column(
        children: <Widget>[
          const Text('Import Wallet'),
          TextField(
            autofocus: true,
            controller: _mInputContentController,
            decoration: const InputDecoration(
              labelText: "助记词/私钥",
              hintText: 'mnemonic/private',
            ),
          ),
          MaterialButton(
              onPressed: () => {import()}, child: const Text("confirm"))
        ],
      ),
    );
  }

  void import() {
    var input = _mInputContentController.text.trim();
    if (input.startsWith("{")) {
      // import json
      importJson(input);
    } else if (input.contains(" ")) {
      // import mnemonic
      importMnemonic(input);
    } else {
      // import private key
      importPrivate(input);
    }
  }

  void importMnemonic(String mnemonic) {
    /// todo: check mnemonic
    var hdWallet = HDWallet.createWithMnemonic(mnemonic);
    var newAddress = hdWallet.getAddressForCoin(TWCoinType.TWCoinTypeNewChain);
    var ethAddress = hdWallet.getAddressForCoin(TWCoinType.TWCoinTypeEthereum);
    print("newAddress: $newAddress, ethAddress: $ethAddress");
    var newPrivate =
        hdWallet.getKeyForCoin(TWCoinType.TWCoinTypeNewChain).data();
    var ethPrivate =
        hdWallet.getKeyForCoin(TWCoinType.TWCoinTypeEthereum).data();
    var hexNewPrivateKey = hex.encode(newPrivate);
    var hexEthPrivateKey = hex.encode(ethPrivate);
    print("newPrivate: $hexNewPrivateKey,\r\n ethPrivate: $hexEthPrivateKey");
    var k1Master = hdWallet.getMaterKey(TWCurve.TWCurveSECP256k1).data();
    var r1Master = hdWallet.getMaterKey(TWCurve.TWCurveNIST256p1).data();
    print(
        "master k1: ${hex.encode(k1Master)},\r\n master r1: ${hex.encode(r1Master)}");
  }

  void importPrivate(String privateKey) {
    /// todo: check private key
  }

  void importJson(String json) {
    /// todo: check json
  }
}
