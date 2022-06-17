import 'package:scan/scan.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/scan_controller.dart';

class ScanQRView extends GetView<ScanViewController> {
  const ScanQRView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var scanQrController = controller;
    return Scaffold(
        appBar: AppBar(
          title: Text('ScanView'),
          centerTitle: true,
        ),
        body: Center(
          child: Container(
            width: 250, // custom wrap size
            height: 250,
            child: ScanView(
              controller: scanQrController.scannerController,
              // custom scan area, if set to 1.0, will scan full area
              scanAreaScale: .7,
              scanLineColor: Colors.green.shade400,
              onCapture: (data) {
                // do something
                scanQrController.onResultQRInfo(data);
              },
            ),
          ),
        ));
  }
}
