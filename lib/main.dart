/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-17 09:19:17
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-06 23:07:37
 * @FilePath: /forcewallet/lib/main.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'generated/locales.g.dart';

void main() {
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
