import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/home/widgets/address_box.dart';
import 'package:pets_mall/Screen/home/widgets/carsoul_image.dart';
import 'package:pets_mall/Screen/home/widgets/deal_of_the_day.dart';
import 'package:pets_mall/Screen/home/widgets/top_category.dart';
import 'package:pets_mall/constant/globalVarable.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: AppBar(
            flexibleSpace: Container(
              decoration:
                  const BoxDecoration(gradient: GlobalVariable.appBarGradient),
            ),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                      height: 42,
                      margin: const EdgeInsets.only(left: 10),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        elevation: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                              hintText: "Search Pets Mall",
                              hintStyle: const TextStyle(fontSize: 17),
                              prefixIcon: InkWell(
                                onTap: () {},
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 23,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: const EdgeInsets.only(top: 10),
                              border: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  borderSide: BorderSide.none),
                              enabledBorder: const OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(7)),
                                  borderSide: BorderSide(
                                      color: Colors.black38, width: 1))),
                        ),
                      )),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: const Icon(
                    Icons.mic,
                    color: Colors.black,
                    size: 25,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              AddressBox(),
              CarouselImage(),
              SizedBox(
                height: 10,
              ),
              TopCategory(),
              SizedBox(
                height: 10,
              ),
              DealOfDay(),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ));
  }
}
