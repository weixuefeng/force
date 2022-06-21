import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:flutter_trust_wallet_core/flutter_trust_wallet_core.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';
import 'package:web3dart/web3dart.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-06-01 21:19:36
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-21 15:39:58
 * @FilePath: /forcewallet/lib/app/utils/extension.dart
 * @Description: 
 */

extension IntExtension on int {
  toUint8List() {
    String numStr = toRadixString(16);
    if (numStr.length % 2 != 0) {
      numStr = "0$numStr";
    }
    return numStr.toUint8List();
  }

  toCoinSymbol() {
    switch (this) {
      case TWCoinType.TWCoinTypeNewChain:
        return "NEW";
      case TWCoinType.TWCoinTypeEthereum:
        return "ETH";
    }
    return "";
  }
}

extension BigintExtension on BigInt {
  toUint8List() {
    String numStr = toRadixString(16);
    if (numStr.length % 2 != 0) {
      numStr = "0$numStr";
    }
    return numStr.toUint8List();
  }
}

const NEW_PREFIX = "NEW";

extension StringExtension on String {
  toUint8List() {
    List<int> data = hex.decode(this);
    return Uint8List.fromList(data);
  }

  utf8Encode() {
    return Uint8List.fromList(utf8.encode(this));
  }

  toNEWAddress(int chainId) {
    print("origin address is: $this");
    var address = this.trim();
    if (address.startsWith(NEW_PREFIX)) {
      return address;
    }
    if (address.startsWith("0x")) {
      address = address.substring(2);
    }
    if (address.length != 40) {
      print(address.length);
      return null;
    }
    var hexChainId = chainId.toRadixString(16);
    var length = 0;
    if (hexChainId.length - 8 > 0) {
      length = hexChainId.length - 8;
    }
    hexChainId = hexChainId.substring(length);
    var data = hexChainId + address;
    if (data.length % 2 != 0) {
      data = "000$data";
    }
    return NEW_PREFIX + Base58.base58Encode(data.toUint8List());
  }

  toHexAddress() {
    var address = this.trim();
    if (!address.startsWith(NEW_PREFIX)) {
      return address;
    }
    address = address.substring(NEW_PREFIX.length);
    return '0x' +
        hex.encode(Base58.base58Decode(address)!.toList()).substring(6);
  }

  toEther() {
    return EtherAmount.fromUnitAndValue(EtherUnit.wei, this).getValueInUnit(EtherUnit.ether);
  }
}
