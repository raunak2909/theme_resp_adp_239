import 'dart:ui';

import 'package:flutter/material.dart';

TextStyle mTextStyleHeadline({Color fontColor = Colors.black, bool isBold  = false}){
  return TextStyle(
    fontSize: 43,
    //color: fontColor,
    fontWeight: isBold ? FontWeight.bold : FontWeight.normal
  );
}

TextStyle mTextStyleSubHeading({Color fontColor = Colors.black, FontWeight fontWeight = FontWeight.normal}){
  return TextStyle(
      fontSize: 25,
      //color: fontColor,
      fontWeight: fontWeight
  );
}

TextStyle mTextStyleBody({Color fontColor = Colors.black, FontWeight fontWeight = FontWeight.normal}){
  return TextStyle(
      fontSize: 16,
      //color: fontColor,
      fontWeight: fontWeight
  );
}

