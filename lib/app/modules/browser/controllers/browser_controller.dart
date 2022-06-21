import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/routes/app_pages.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserController extends GetxController {
  WebViewController? webviewController;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() async {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void onURLSelected(String input) {
    webviewController?.loadUrl(input);
  }
}
