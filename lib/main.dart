import 'package:flutter/material.dart';
import 'package:forcewallet/app/service/rpc_service.dart';

import 'package:get/get.dart';

import 'package:forcewallet/app/service/wallet_service.dart';

import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-17 09:19:17
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-10 17:58:43
 * @FilePath: /forcewallet/lib/main.dart
 * @Description: 
 */

void main() async {
  Get.put(WalletService());
  Get.put(ForceRpcService());
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
