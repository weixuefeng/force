import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameFocusNode = FocusNode();

    return Scaffold(
        appBar: AppBar(
          title: Text("CreateWallet"),
          elevation: 0,
        ),
        body: Container(
          padding: EdgeInsets.all(16),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(bottom: 16),
                      child: TextFormField(
                        initialValue: "",
                        onChanged: (value) => {
                          controller.name.value = value
                        },
                        focusNode: nameFocusNode,
                        decoration: InputDecoration(
                          label: Text("Name"),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      initialValue: "",
                      onChanged: (value) => {
                        controller.password.value = value
                      },
                      decoration: InputDecoration(
                        label: Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                        helperText: "不少于8位字符，建议混合大小写字母，数字，符号",

                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 16),
                    child: TextFormField(
                      initialValue: "",
                      onChanged: (value) => {
                        controller.confirmPassword.value = value
                      },
                      decoration: InputDecoration(
                        label: Text("ConfirmPassword"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              ElevatedButton(
                  onPressed: () => {
                    controller.createWallet()
                  },
                  child: Text("Create"),
              )
            ],
          ),
        ));
  }
}
