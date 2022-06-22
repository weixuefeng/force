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
          title: Text('SendView'),
          centerTitle: true,
        ),
        body: Obx(() => Container(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextFormField(
                  controller: controller.mAddressInputController.value,
                  cursorColor: Theme.of(context).cursorColor,
                  maxLength: 50,
                  onChanged: (value) => {controller.updateAddress(value)},
                  decoration: InputDecoration(
                      labelText: '接收者',
                      labelStyle: TextStyle(
                        color: Color(0xFF6200EE),
                      ),
                      helperText: '接收者地址或者ENS',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFF6200EE)),
                      ),
                      suffixIcon: ElevatedButton(
                        onPressed: () => {controller.openScan()},
                        child: Icon(Icons.qr_code_2_outlined),
                      )),
                ),
                TextFormField(
                  cursorColor: Theme.of(context).cursorColor,
                  initialValue: '',
                  maxLength: 50,
                  onChanged: (value) => {controller.updateAmount(value)},
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: '金额',
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                    helperText: '转账金额',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
                ),

                TextFormField(
                  readOnly: true,
                  autofocus: false,
                  cursorColor: Theme.of(context).cursorColor,
                  initialValue: 'NEW',
                  decoration: InputDecoration(
                    labelText: controller.mStoredWalletInfo.value.coinType.toCoinSymbol(),
                    labelStyle: TextStyle(
                      color: Color(0xFF6200EE),
                    ),
                    helperText: '网络',
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFF6200EE)),
                    ),
                  ),
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

                          onChanged: (value) => {controller.updatePassword(value)},
                          decoration: InputDecoration(
                            labelText: 'password',
                            labelStyle: TextStyle(
                              color: Color(0xFF6200EE),
                            ),
                            helperText: 'password',
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Color(0xFF6200EE)),
                            ),
                            suffixIcon: TextButton(
                              onPressed: () => {controller.sendTransaction()},
                              child: Text("confirm"),
                            )
                          ),
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
          )
        )
        )
    );
  }


}
