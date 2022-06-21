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
          title: _getBrowserTopBar(),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        body: _getBrowser());
  }

  Widget _getBrowser() {
    return WebView(
      initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (c) {
        Get.put(BrowserController());
        controller.webviewController = c;
      },
      onPageStarted: (String url) {},
      onPageFinished: (String url) {},
      onWebResourceError: (error) {},
    );
  }

  Widget _getBrowserTopBar() {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: Container(
              child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Website url with http(s)',
                    suffixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.only(
                        left: 20, right: 20, top: 12, bottom: 12),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onSubmitted: (input) {
                    controller.onURLSelected(input);
                  }),
            )),
      ],
    );
  }
}
