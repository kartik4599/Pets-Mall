import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/admin/screen/post_screen.dart';
import 'package:pets_mall/constant/globalVarable.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = "/admin";
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
  int _page = 0;
  double bottomWedth = 43;
  double bottomBorderWidht = 3;

  List<Widget> pages = [
    const Center(
      child: PostScreen(),
    ),
    const Center(
      child: Text("Orders"),
    ),
    const Center(
      child: Text("Account"),
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          flexibleSpace: Container(
            decoration:
                const BoxDecoration(gradient: GlobalVariable.appBarGradient),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  "assets/images/amazon_in.png",
                  width: 120,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              const Text(
                "Admin",
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: GlobalVariable.blue),
              )
            ],
          ),
        ),
      ),
      body: pages[_page],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _page,
        selectedItemColor: GlobalVariable.blue,
        unselectedItemColor: GlobalVariable.lightBlue,
        backgroundColor: Colors.white,
        iconSize: 28,
        onTap: updatePage,
        items: [
          // Posts
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
          // Analytics
          BottomNavigationBarItem(
              icon: Container(
                width: bottomWedth,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color:
                                _page == 1 ? GlobalVariable.blue : Colors.white,
                            width: bottomBorderWidht))),
                child: const Icon(Icons.analytics_outlined),
              ),
              label: ""),
          // Account
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
