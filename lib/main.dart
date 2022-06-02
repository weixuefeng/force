/*
 * @Author: pony@diynova.com
 * @Date: 2022-05-17 09:19:17
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-02 20:27:38
 * @FilePath: /forcewallet/lib/main.dart
 * @Description: 
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
