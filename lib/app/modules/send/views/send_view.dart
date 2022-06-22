import 'package:flutter/material.dart';
import 'package:forcewallet/app/utils/extension.dart';

import 'package:get/get.dart';

import '../controllers/send_controller.dart';

class SendView extends GetView<SendController> {
  const SendView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var focusNode = FocusNode();

    return Scaffold(
        appBar: AppBar(
          title: Text('Send',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0.0,
          foregroundColor: Colors.black,
        ),
        body: Obx(() => Container(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: controller.mAddressInputController.value,
                    cursorColor: Theme.of(context).cursorColor,
                    // maxLength: 50,
                    onChanged: (value) => {controller.updateAddress(value)},
                    decoration: InputDecoration(
                      labelText: '接收者',
                      labelStyle: TextStyle(
                        color: Color(0xFF6200EE),
                        fontWeight: FontWeight.w600,
                      ),
                      helperText: '接收者地址或者ENS',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6200EE)),
                      ),
                      suffixIcon: Container(
                          // width: 24,
                          // height: 24,
                          child: IconButton(
                        onPressed: () => {controller.openScan()},
                        icon: Icon(
                          Icons.qr_code_2_outlined,
                          size: 30,
                        ),
                      )),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    width: double.infinity,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              '目标网络',
                              style: TextStyle(
                                  color: Color(0xFF6200EE),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16),
                            ),
                          ),
                          Obx(() => Container(
                                margin: const EdgeInsets.only(top: 12),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 4, bottom: 4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.pink[300],
                                ),
                                child: Text(
                                  controller.mStoredWalletInfo.value.coinType
                                      .toChainName(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12),
                                ),
                              )),
                          Obx(() => Container(
                                margin: const EdgeInsets.only(top: 4),
                                child: Text(
                                    '发送${controller.mStoredWalletInfo.value.coinType.toCoinSymbol()}，接受者将在${controller.mStoredWalletInfo.value.coinType.toChainName()}上收到${controller.mStoredWalletInfo.value.coinType.toCoinSymbol()}',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 12,
                                    )),
                              )),
                          TextFormField(
                            cursorColor: Theme.of(context).cursorColor,
                            initialValue: '',
                            // maxLength: 50,
                            onChanged: (value) =>
                                {controller.updateAmount(value)},
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              labelText: '数量',
                              labelStyle: TextStyle(
                                color: Color(0xFF6200EE),
                                fontWeight: FontWeight.w600,
                              ),
                              helperText: '转账数量',
                              enabledBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0xFF6200EE)),
                              ),
                            ),
                          ),
                        ]),
                  ),
                  ElevatedButton(
                    onPressed: () => {
                      Get.bottomSheet(
                        Container(
                          child: TextFormField(
                            focusNode: focusNode,
                            cursorColor: Theme.of(context).cursorColor,
                            initialValue: '',
                            maxLength: 50,
                            onChanged: (value) =>
                                {controller.updatePassword(value)},
                            decoration: InputDecoration(
                                labelText: 'password',
                                labelStyle: TextStyle(
                                  color: Color(0xFF6200EE),
                                ),
                                helperText: 'password',
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xFF6200EE)),
                                ),
                                suffixIcon: TextButton(
                                  onPressed: () => {
                                    controller.sendTransaction(),
                                    focusNode.unfocus(),
                                    Get.back()
                                  },
                                  child: Text("confirm"),
                                )),
                          ),
                          height: 100,
                        ),
                        backgroundColor: Colors.pinkAccent,
                        barrierColor: Colors.transparent,
                        isScrollControlled: false,
                      ),
                      focusNode.requestFocus()
                    },
                    child: Text("Confirm"),
                  )
                ],
              ),
            ))));
  }
}
