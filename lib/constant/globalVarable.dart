import 'package:flutter/material.dart';

String uri = 'http://localhost:2000//';

class GlobalVariable {
  static const myBlue = MaterialColor(0xff3D5A80, {
    50: Color(0xff3D5A80),
    100: Color(0xff3D5A80),
    200: Color(0xff3D5A80),
    300: Color(0xff3D5A80),
    400: Color(0xff3D5A80),
    500: Color(0xff3D5A80),
    600: Color(0xff3D5A80),
    700: Color(0xff3D5A80),
    800: Color(0xff3D5A80),
    900: Color(0xff3D5A80)
  });
  static const blue = Color(0xff3D5A80);
  static const myGrey = Color.fromARGB(255, 240, 240, 240);
  static const lightBlue = Color(0xff98C1D9);
  static const skyBlue = Color(0xffE0FBFC);
  static const orange = Color(0xffEE6C4D);

  static const appBarGradient = LinearGradient(colors: [
    lightBlue,
    skyBlue,
  ]);
}
