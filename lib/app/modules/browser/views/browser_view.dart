import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:forcewallet/app/database/store_model.dart';
import 'package:forcewallet/app/modules/browser/controllers/browser_controller.dart';
import 'package:forcewallet/app/service/wallet_service.dart';
import 'package:forcewallet/app/utils/extension.dart';
import 'package:path/path.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BrowserView extends GetView<BrowserController> {
  const BrowserView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    WalletService service = Get.find<WalletService>();
    return Scaffold(
        appBar: AppBar(
          title: Text('Home',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: Container(
          child: WebView(
            initialUrl: 'https://flutter.cn',
          ),
        ));
  }

}