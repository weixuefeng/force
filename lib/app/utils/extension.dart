import 'dart:convert';
import 'dart:typed_data';

import 'package:convert/convert.dart';
import 'package:flutter_trust_wallet_core/trust_wallet_core_ffi.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-06-01 21:19:36
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-07 14:00:17
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

extension StringExtension on String {
  toUint8List() {
    List<int> data = hex.decode(this);
    return Uint8List.fromList(data);
  }

  utf8Encode() {
    return Uint8List.fromList(utf8.encode(this));
  }
}
