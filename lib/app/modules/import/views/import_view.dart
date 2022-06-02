import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/import_controller.dart';

class ImportView extends GetView<ImportController> {
  const ImportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ImportView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ImportView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
