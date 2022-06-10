import 'package:get/get.dart';

import '../controllers/network_manage_controller.dart';

class NetworkManageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NetworkManageController>(
      () => NetworkManageController(),
    );
  }
}
