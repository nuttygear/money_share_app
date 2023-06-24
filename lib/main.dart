// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:money_share_app/views/input_money_share_ui.dart';

void main() {
  runApp(
    //เรียก widget หลักของแอปฯ แนะนำ MaterialApp
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputMoneyShareUI(), //เรียกหน้าที่จะใช้ทำเป็นหน้าจอแรก
    ),
  );
}
