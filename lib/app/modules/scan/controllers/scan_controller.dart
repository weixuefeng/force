import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scan/scan.dart';

class ScanViewController extends GetxController {
  late ScanController scannerController;

  @override
  void onInit() {
    super.onInit();
    scannerController = ScanController();
  }

  @override
  void onReady() async {
    await checkCameraPermissionAndScan();
  }

  @override
  void onClose() {
    stopScan();
  }

  void onResultQRInfo(String data) {
    stopScan();
    Get.back(result: data);
  }

  checkCameraPermissionAndScan() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      startScan();
    }
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
      requestPermission();
    }
    // You can can also directly ask the permission about its status.
    if (await Permission.location.isRestricted) {
      // The OS restricts access, for example because of parental controls.
      requestPermission();
    }
  }

  void requestPermission() async {
    if (await Permission.camera.request().isGranted) {
      // Either the permission was already granted before or the user just granted it.
      startScan();
    }
  }

  void startScan() async {
    scannerController.resume();
  }

  void stopScan() async {
    scannerController.pause();
  }
}
