import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget getTitleFormated({required String title, required String subtitle, String? msg, required Color colorText, required bool biggest}) {
  double fontSize = 25;
  double verticalSubt = 4;
  if(biggest){
    fontSize = 70;
    verticalSubt = 35;
  }
  return RichText(
    overflow: TextOverflow.ellipsis,
    text: TextSpan(children: [
      TextSpan(
          text: title,
          style: TextStyle(
              color: colorText, fontSize: fontSize, fontWeight: FontWeight.bold)),
      WidgetSpan(
        child: Transform.translate(
          offset: Offset(2, verticalSubt),
          child: Text(subtitle,
              textScaleFactor: 0.7,
              style: TextStyle(
                  color: colorText,
                  fontSize: fontSize,
                  fontWeight: FontWeight.bold)),
        ),
      ),
      if (msg != null)
        TextSpan(
            text: msg,
            style: TextStyle(
                color: colorText, fontSize: 18, fontWeight: FontWeight.bold)),
    ]),
  );
}