import 'package:forcewallet/app/modules/setting/controllers/setting_controller.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/modules/home/controllers/home_controller.dart';

import '../controllers/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(
      () => MainController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<SettingController>(
      () => SettingController(),
    );
  }
}
