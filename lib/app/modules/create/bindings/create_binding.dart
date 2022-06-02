/*
 * @Author: pony@diynova.com
 * @Date: 2022-06-02 17:22:25
 * @LastEditors: pony@diynova.com
 * @LastEditTime: 2022-06-02 20:34:52
 * @FilePath: /forcewallet/lib/app/modules/create/bindings/create_binding.dart
 * @Description: 
 */
import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateBinding extends Bindings {
  String a = "";
  @override
  void dependencies() {
    Get.lazyPut<CreateController>(
      () => CreateController(),
    );
  }
}
