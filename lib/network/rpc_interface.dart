/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-17 17:55:00
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-05-18 09:52:43
 * @FilePath: /forcewallet/lib/network/rpc_interface.dart
 * @Description: 
 */
import 'dart:typed_data';

import 'package:web3dart/web3dart.dart';

abstract class RpcInterface {
  Future<BigInt?> getBalance(String address);

  Future<int> getTransactionCount(String address);

  Future<BigInt?> gasPrice();

  Future<BigInt> estimateGas(
      {String? fromAddress,
      String? toAddress,
      EtherAmount? value,
      BigInt? amountOfGas,
      EtherAmount? gasPrice,
      EtherAmount? maxPriorityFeePerGas,
      EtherAmount? maxFeePerGas,
      Uint8List? data});

  Future<String> sendRawTransaction(Uint8List signedTransaction);

  Future<int> getNetworkId();
}
