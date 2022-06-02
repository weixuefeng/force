/*
 * @Author: weixuefeng weixuefeng@diynova.com
 * @Date: 2022-06-02 20:28:13
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-02 20:47:26
 * @FilePath: /forcewallet/lib/app/modules/splash/views/splash_view.dart
 * @Description: 这是默认设置,请设置`customMade`, 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 */
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashView'),
        centerTitle: true,
      ),
      body: Center(
        child: Obx(() => Text(
              'SplashView is working ${controller.content.value}',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
