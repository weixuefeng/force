import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BrowserTopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: TextField(
              autocorrect: false,
            )),
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
