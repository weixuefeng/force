import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowserTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //横向布局
    return Row(
      children: <Widget>[
        //因为它是左右占比结构,所以使用Expanded 的flex
        Expanded(
          flex: 1,
          child: TextField(autocorrect: false,)
        ),
        Expanded(
          flex: 0,
          child: IconButton(
            icon: Icon(Icons.notifications),
            color: Colors.black38,
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}