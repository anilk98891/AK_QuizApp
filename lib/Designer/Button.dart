import 'package:anilquizapp/CustomFunctions/CustomAlerts.dart';
import 'package:flutter/material.dart';

Widget customButton(title,context,ResponseCallback callBack,shadowColor) {
  return Container(
    margin: EdgeInsets.only(top: 20),
    height: 80,
    width: 150,
    decoration: BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(75),
      boxShadow: [
        BoxShadow(
          spreadRadius: 1,
          blurRadius: 4,
          offset: Offset(4, 3),
          color: shadowColor
        )
      ]
    ),
    child: FlatButton(
      onPressed: () {
        callBack(title);
      },
      child: Text(title,
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold)),
    ),
  );
}
