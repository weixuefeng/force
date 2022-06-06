import 'package:flutter/material.dart';
import 'package:forcewallet/app/modules/home/controllers/home_controller.dart';

import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 200,
            child: PageView.builder(
              itemBuilder: (context, index) => _buildPageItem(index),
              itemCount: 10,
            )),
        Container(
          height: 200,
          child: ListView(
            children: [
              for (var i = 0; i < controller.walletInfos.length; i++)
                Text("data")
            ],
          ),
        )
      ],
    );
  }

  Widget _buildPageItem(int index) {
    return Container(
      child: Center(
        child: Text(
          '$index',
          style: TextStyle(fontSize: 50),
        ),
      ),
    );
  }
}
