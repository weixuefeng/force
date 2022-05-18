/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-17 17:56:48
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-18 11:10:14
 * @FilePath: /forcewallet/lib/network/rpc_ethereum.dart
 * @Description: 
 */
import 'dart:typed_data';

import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import 'rpc_interface.dart';

class RpcEthereum extends RpcInterface {
  final mHttpClient = Client();

  late final Web3Client mWeb3Client;

  RpcEthereum(String url) {
    mWeb3Client = Web3Client(url, mHttpClient);
  }

  @override
  Future<BigInt> estimateGas(
      {String? fromAddress,
      String? toAddress,
      EtherAmount? value,
      BigInt? amountOfGas,
      EtherAmount? gasPrice,
      EtherAmount? maxPriorityFeePerGas,
      EtherAmount? maxFeePerGas,
      Uint8List? data}) {
    EthereumAddress? sender;
    if (fromAddress != null) {
      sender = EthereumAddress.fromHex(fromAddress);
    }
    EthereumAddress? to;
    if (toAddress != null) {
      to = EthereumAddress.fromHex(toAddress);
    }
    return mWeb3Client.estimateGas(
        sender: sender,
        to: to,
        value: value,
        amountOfGas: amountOfGas,
        gasPrice: gasPrice,
        maxPriorityFeePerGas: maxPriorityFeePerGas,
        maxFeePerGas: maxFeePerGas,
        data: data);
  }

  @override
  Future<BigInt?> gasPrice() {
    return mWeb3Client
        .getGasPrice()
        .then((value) => value.getValueInUnitBI(EtherUnit.wei));
  }

  @override
  Future<BigInt?> getBalance(String address) async {
    return mWeb3Client
        .getBalance(EthereumAddress.fromHex(address))
        .then((value) => value.getValueInUnitBI(EtherUnit.wei));
  }

  @override
  Future<int> getTransactionCount(String address) {
    return mWeb3Client.getTransactionCount(EthereumAddress.fromHex(address));
  }

  @override
  Future<String> sendRawTransaction(Uint8List signedTransaction) {
    return mWeb3Client.sendRawTransaction(signedTransaction);
  }

  @override
  Future<int> getNetworkId() {
    return mWeb3Client.getNetworkId();
  }
}
