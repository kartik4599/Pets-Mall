import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/home/screens/home_screen.dart';
import 'package:pets_mall/constant/globalVarable.dart';

class BottomBar extends StatefulWidget {
  static const String routeName = "/actual-home";
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _page = 1;
  double bottomWedth = 43;
  double bottomBorderWidht = 3;

  List<Widget> pages = [
    const Center(
      child: HomeScreen(),
    ),
    const Center(
      child: Text("Cart Page"),
    ),
    const Center(
      child: Text("Profile Page"),
    )
  ];

  void updatePage(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.blue,
        unselectedItemColor: GlobalVariable.lightBlue,
        backgroundColor: Colors.white,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // Home Page
          BottomNavigationBarItem(
              icon: Container(
                width: bottomWedth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color:
                                _page == 0 ? GlobalVariable.blue : Colors.white,
                            width: bottomBorderWidht))),
                child: const Icon(Icons.home_outlined),
              ),
              label: ""),
          // Profile
          BottomNavigationBarItem(
              icon: Container(
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color:
                                _page == 1 ? GlobalVariable.blue : Colors.white,
                            width: bottomBorderWidht))),
                width: bottomWedth,
                child: Badge(
                    elevation: 0,
                    badgeContent: const Text(
                      "2",
                      style: TextStyle(color: GlobalVariable.blue),
                    ),
                    badgeColor: Colors.white,
                    child: const Icon(CupertinoIcons.cart)),
              ),
              label: ""),
          // Cart
          BottomNavigationBarItem(
              icon: Container(
                width: bottomWedth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color:
                                _page == 2 ? GlobalVariable.blue : Colors.white,
                            width: bottomBorderWidht))),
                child: const Icon(Icons.person_outline_outlined),
              ),
              label: ""),
        ],
      ),
    );
  }
}
