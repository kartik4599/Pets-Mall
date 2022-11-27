import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/account/widgets/account_button.dart';

class TopButton extends StatefulWidget {
  const TopButton({super.key});

  @override
  State<TopButton> createState() => _TopButtonState();
}

class _TopButtonState extends State<TopButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              onTap: () {},
              text: "Your Order",
            ),
            AccountButton(
              onTap: () {},
              text: "Turn Seller",
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              onTap: () {},
              text: "Log Out",
            ),
            AccountButton(
              onTap: () {},
              text: "Your WishList",
            ),
          ],
        ),
      ],
    );
  }
}
