import 'package:flutter/material.dart';

import 'package:ui_flutter/Book/page/book_page.dart';
import 'package:ui_flutter/OTP_Validacion/homeOTP.dart';
import 'package:ui_flutter/bagShop/page/home_screen.dart';
import 'package:ui_flutter/validacionPassword/page/validacion_Pass.dart';

final pageRoute = <Rutas> [

  Rutas( Icons.shopping_bag_outlined, 'Bag Shop', Colors.pink , HomeScreenPage() ),
  Rutas( Icons.book_outlined, 'Libreria', Colors.green , BookPage() ),
  Rutas( Icons.verified_user, 'Validar Password', Colors.blue , ValidacionPassPage() ),
  Rutas( Icons.email_sharp, 'Validacion OTP', Colors.yellowAccent , HomeOTPPage() ),

];

class Rutas {

  final IconData icon;
  final String titulo;
  final Color color;
  final Widget page;

  Rutas(this.icon, this.titulo, this.color, this.page);

}