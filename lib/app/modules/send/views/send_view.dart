import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/send_controller.dart';

class SendView extends GetView<SendController> {
  const SendView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SendView'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                cursorColor: Theme.of(context).cursorColor,
                initialValue: '',
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
                ),
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
                ),
              ),
              TextFormField(
                readOnly: true,
                autofocus: false,
                cursorColor: Theme.of(context).cursorColor,
                initialValue: 'NEW',
                decoration: InputDecoration(
                  labelText: 'NEW',
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
                onPressed: () => {controller.sendTransaction()},
                child: Text("Confirm"),
              )
            ],
          ),
        ));
  }
}
