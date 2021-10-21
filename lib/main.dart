import 'package:flutter/material.dart';

import 'constants/constants.dart';

import 'package:ui_flutter/OTP_Validacion/homeOTP.dart';
import 'package:ui_flutter/menu.dart';



 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        textTheme: Theme.of(context).textTheme.apply(bodyColor: kTextColor),
      ),
      home : MenuPage(),
    );
  }
}