import 'package:get/get.dart';

import '../controllers/scan_controller.dart';

class ScanBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ScanViewController>(
      ScanViewController(),
    );
  }
}
