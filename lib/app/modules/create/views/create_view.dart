import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CreateView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CreateView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
