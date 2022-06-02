import 'dart:typed_data';

import 'package:convert/convert.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-06-01 21:19:36
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-02 11:09:46
 * @FilePath: /forcewallet/lib/utils/extension.dart
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
}
