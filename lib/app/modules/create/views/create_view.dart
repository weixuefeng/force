import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Create Wallet',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        body: Center(
            child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            Container(
              margin: const EdgeInsets.only(top: 60),
              child: Text(
                '欢迎使用',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                margin: const EdgeInsets.only(top: 4),
                child: Text(
                  'Force Wallet',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                )),
            Container(
                margin: const EdgeInsets.only(top: 8),
                child: Text(
                  '为加密资产安全保驾护航',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                )),
            // ElevatedButton(
            //   onPressed: () {
            //     controller.createWallet();
            //   },
            //   child: Image.asset('images/create.jpg'),
            // ),
            Container(
              // width: 100,
              height: 140,
              margin: EdgeInsets.fromLTRB(0, 32, 0, 0),
              child: InkWell(
                onTap: () => {
                  // controller.create_new_task()
                  controller.createWallet()
                },
                child: Image(
                  image: AssetImage("images/create.jpg"),
                  fit: BoxFit.fill,
                ),
              ),
            ),

            Container(
              // width: 100,
              height: 140,
              margin: EdgeInsets.fromLTRB(0, 16, 0, 0),
              child: InkWell(
                onTap: () => {},
                child: Image(
                    image: AssetImage("images/import.jpg"), fit: BoxFit.fill),
              ),
            )
          ],
        )));
  }
}
