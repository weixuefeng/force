import 'package:get/get.dart';

import '../controllers/import_controller.dart';

class ImportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportController>(
      () => ImportController(),
    );
  }
}
