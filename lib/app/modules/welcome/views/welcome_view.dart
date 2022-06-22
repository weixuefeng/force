import 'package:flutter/material.dart';
import 'package:forcewallet/app/modules/create/bindings/create_binding.dart';
import 'package:forcewallet/app/modules/create/views/create_view.dart';
import 'package:forcewallet/app/routes/app_pages.dart';

import 'package:get/get.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 60),
                  child: Text(
                    '欢迎使用',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 4),
                    child: Text(
                      'Force Wallet',
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                      '为加密资产安全保驾护航',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Container(
                  // width: 100,
                  height: 140,
                  margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
                  child: InkWell(
                    onTap: () => {
                      // controller.create_new_task()
                      Get.to(() => CreateView(), binding: CreateBinding())
                    },
                    child: Image(
                      image: AssetImage("images/create.jpg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),

                Container(
                  // width: 100,
                  height: 140,
                  margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
                  child: InkWell(
                    onTap: () => {},
                    child: Image(
                        image: AssetImage("images/import.jpg"), fit: BoxFit.fill),
                  ),
                )
              ],
            )));
  }
}
