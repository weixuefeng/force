/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-16 18:36:04
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-19 19:47:10
 * @FilePath: /forcewallet/lib/page/import.dart
 * @Description: 
 */
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/protobuf/Ethereum.pb.dart'
    as Ethereum;
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:forcewallet/network/rpc_ethereum.dart';
import 'package:web3dart/web3dart.dart';

import '../constant/constant.dart';

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
              hintText: 'mnemonic/private/json',
            ),
          ),
          MaterialButton(
              onPressed: () => {import()}, child: const Text("confirm")),
          MaterialButton(onPressed: () => {send()}, child: const Text("send"))
        ],
      ),
    );
  }

  void import() async {
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
    var k1Master =
        hdWallet.getMaterKey(TWCurve.TWPublicKeyTypeSECP256k1Extended).data();
    var r1Master =
        hdWallet.getMaterKey(TWCurve.TWPublicKeyTypeNIST256p1Extended).data();
    print(
        "master k1: ${hex.encode(k1Master)},\r\n master r1: ${hex.encode(r1Master)}");

    /**
       * mnemonic: seek mixed range accident lift indoor three art green mad enlist ugly
       * newAddress: 0x9DE95e3234410B89A363d3429d5Ca24D20Fa91Bc, 
       * ethAddress: 0x31dC2F96d14b8b07cD371E4512FA778e70FC15B8
        newPrivate: cbc433938ce6ec9aee7a8ed852430ec606bb7b5f62b3128df4e8357f497eded5,
        ethPrivate: 8ec3848366dcf4655ced8f2a799859e1796f53954ff199ccfd34021b5bd2c049
        master k1: 84519b8f82ea5ae0210baab002d188695fc3d08fd8c47e4b9fe56de25125dab3,
        master r1: 767e806a25a3acf709a452c1c615b448761337d409370a294cabba170d0be249
       */
  }

  void importPrivate(String priv) {
    /// todo: check private key
    var privateKeyData = hex.decode(priv) as Uint8List;
    var storedKey = StoredKey.importPrivateKey(
        privateKeyData, "name", "password", TWCoinType.TWCoinTypeNewChain);
    var count = storedKey?.accountCount();
    print("count: $count");
    var json = storedKey?.exportJson();
    print(json);

    var privateKey = PrivateKey.createWithData(privateKeyData);
    var publicKey = privateKey.getPublicKey(3);
    print(publicKey);
    var newAddress =
        AnyAddress.createWithPublicKey(publicKey, TWCoinType.TWCoinTypeNewChain)
            .data();
    print("newAddress: ${hex.encode(newAddress)}");

    rpcRequest(hex.encode(newAddress));
  }

  void importJson(String json) {
    /// todo: check json
  }

  void rpcRequest(address) async {
    var rpc = RpcEthereum(NewChainTest);
    var balance = await rpc.getBalance(address);
    var count = await rpc.getTransactionCount(address);
    var gasPrice = await rpc.gasPrice();
    var gasLimit = await rpc.estimateGas(
        fromAddress: address, toAddress: address, value: EtherAmount.zero());
    print(
        "balance: $balance, count: $count, gasPrice: $gasPrice, gasLimit: $gasLimit");
  }

  void send() async {
    var rpc = RpcEthereum(EthRinkbyTest);
    // new priv: cbc433938ce6ec9aee7a8ed852430ec606bb7b5f62b3128df4e8357f497eded5
    // eth priv: c8b66a6cea18f8e410f0a6c66e0415d90134315c9080c0a07434d0f0ab7d9aa9
    var priv =
        "c8b66a6cea18f8e410f0a6c66e0415d90134315c9080c0a07434d0f0ab7d9aa9";
    var privateKeyData = hex.decode(priv) as Uint8List;

    var storedKey = StoredKey.importPrivateKey(
        privateKeyData, "name", "password", TWCoinType.TWCoinTypeEthereum);
    var privateKey = PrivateKey.createWithData(privateKeyData);
    var publicKey =
        privateKey.getPublicKey(TWCurve.TWPublicKeyTypeSECP256k1Extended);
    var newAddress =
        AnyAddress.createWithPublicKey(publicKey, TWCoinType.TWCoinTypeEthereum)
            .data();
    var addressStr = hex.encode(newAddress);

    var balance = await rpc.getBalance(addressStr);
    var count = await rpc.getTransactionCount(addressStr);
    var gasPrice = await rpc.gasPrice();
    var gasLimit = await rpc.estimateGas(
        fromAddress: addressStr,
        toAddress: addressStr,
        value: EtherAmount.zero());
    var id = await rpc.getNetworkId();

    print(
        "id:$id balance: $balance, count: $count, gasPrice: $gasPrice, gasLimit: $gasLimit");
    Ethereum.SigningInput input = Ethereum.SigningInput(
        chainId: [id],
        nonce: [count],
        gasPrice: [gasPrice!.toInt()],
        gasLimit: [gasLimit.toInt()],
        maxFeePerGas: [10000],
        maxInclusionFeePerGas: [10000],
        toAddress: "0x9de95e3234410b89a363d3429d5ca24d20fa91bc",
        privateKey: privateKeyData,
        transaction: Ethereum.Transaction(
            transfer: Ethereum.Transaction_Transfer(
          amount: [0],
        )));
    print(input);
    final output = Ethereum.SigningOutput.fromBuffer(
        AnySigner.sign(input.writeToBuffer(), TWCoinType.TWCoinTypeNewChain)
            .toList());
    var res = output.encoded;
    print("res: ${hex.encode(res)}");
    var hash = await rpc.sendRawTransaction(Uint8List.fromList(res));
    print("hash: $hash");
  }
}
