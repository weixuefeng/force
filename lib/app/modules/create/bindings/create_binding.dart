import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    print("create binding");
    Get.put<CreateController>(
      CreateController(),
    );
  }
}
