import 'package:flutter/material.dart';
import 'package:forcewallet/app/database/object_box.dart';

import 'package:get/get.dart';

import 'package:forcewallet/app/service/wallet_service.dart';
import 'package:path/path.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-17 09:19:17
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-10 10:52:48
 * @FilePath: /forcewallet/lib/main.dart
 * @Description: 
 */

void main() async {
  Get.put(WalletService());
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      translationsKeys: AppTranslation.translations,
      locale: const Locale('en_US'),
      fallbackLocale: const Locale("en_US"),
    ),
  );
}
