import 'package:flutter/material.dart';

// http://192.168.99.157:2000 mobile
// http://192.168.1.101:2000 cs lab
// http://192.168.137.19:2000
// http://192.168.88.157:2000
// 192.168.66.157 android
String uri = "http://192.168.66.157:2000";

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
    900: Color(0xff3D5A80),
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

  static const homeAppBarGradient = LinearGradient(colors: [
    skyBlue,
    lightBlue,
  ]);

  static const List<String> carouselImages = [
    'https://images-eu.ssl-images-amazon.com/images/G/31/img21/Wireless/WLA/TS/D37847648_Accessories_savingdays_Jan22_Cat_PC_1500.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img2021/Vday/bwl/English.jpg',
    'https://images-eu.ssl-images-amazon.com/images/G/31/img22/Wireless/AdvantagePrime/BAU/14thJan/D37196025_IN_WL_AdvantageJustforPrime_Jan_Mob_ingress-banner_1242x450.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/Symbol/2020/00NEW/1242_450Banners/PL31_copy._CB432483346_.jpg',
    'https://images-na.ssl-images-amazon.com/images/G/31/img21/shoes/September/SSW/pc-header._CB641971330_.jpg',
  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Food',
      'image': 'assets/images/category/11.png',
    },
    {
      'title': 'Accessories',
      'image': 'assets/images/category/3.png',
    },
    {
      'title': 'House',
      'image': 'assets/images/category/2.png',
    },
    {
      'title': 'Grooming',
      'image': 'assets/images/category/1.png',
    },
    {
      'title': 'Toys',
      'image': 'assets/images/category/4.png',
    },
    {
      'title': 'Shampoo and Soap',
      'image': 'assets/images/category/13.png',
    },
  ];
}
