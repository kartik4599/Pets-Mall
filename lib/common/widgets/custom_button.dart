import 'package:flutter/material.dart';
import 'package:pets_mall/constant/globalVarable.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButtom({
    Key? key,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(text),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 50),
          backgroundColor: GlobalVariable.orange),
    );
  }
}
