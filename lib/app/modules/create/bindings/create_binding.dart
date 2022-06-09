import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    print("binding");
    Get.lazyPut<CreateController>(
      () => CreateController(),
    );
  }
}
