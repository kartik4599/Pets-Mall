import 'dart:io';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/admin/services/admin_services.dart';
import 'package:pets_mall/common/widgets/custom_button.dart';
import 'package:pets_mall/common/widgets/custom_textfiled.dart';
import 'package:pets_mall/constant/globalVarable.dart';
import 'package:pets_mall/constant/utils.dart';

class AddProductScreen extends StatefulWidget {
  static const String routeName = "/add-product";

  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final TextEditingController productNameController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController quanitiyController = TextEditingController();
  final AdminServices adminServices = AdminServices();
  final _addProductFormkey = GlobalKey<FormState>();
  String currentCaterory = "Pet Food";

  List<String> category = [
    "Pet Food",
    "Pet Accessories",
    "Pet House",
    "Pet Grooming",
    "Pet Toy",
    "Pet Shampoo and Shop "
  ];

  void sellProduct() {
    if (_addProductFormkey.currentState!.validate() && images.isNotEmpty) {
      adminServices.sellProduct(
          context: context,
          name: productNameController.text,
          description: descriptionController.text,
          price: double.parse(priceController.text),
          quantity: double.parse(quanitiyController.text),
          category: currentCaterory,
          images: images);
    } else {
      showSnackBar(context, "Fill the complete Information");
    }
  }

  List<File> images = [];

  void selectImage() async {
    var res = await pickImages();
    setState(() {
      images = res;
    });
  }

  @override
  void dispose() {
    super.dispose();
    productNameController.dispose();
    descriptionController.dispose();
    priceController.dispose();
    quanitiyController.dispose();
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
            centerTitle: true,
            title: const Text(
              "Add Product",
              style: TextStyle(color: Colors.black),
            )),
      ),
      body: SingleChildScrollView(
          child: Form(
              key: _addProductFormkey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: selectImage,
                      child: images.isNotEmpty
                          ? CarouselSlider(
                              items: images.map((i) {
                                return Builder(
                                    builder: (BuildContext context) =>
                                        Image.file(
                                          i,
                                          fit: BoxFit.cover,
                                          height: 200,
                                        ));
                              }).toList(),
                              options: CarouselOptions(
                                  viewportFraction: 1,
                                  height: 200,
                                  autoPlay: true,
                                  autoPlayInterval: const Duration(seconds: 5)),
                            )
                          : DottedBorder(
                              borderType: BorderType.RRect,
                              radius: const Radius.circular(10),
                              strokeCap: StrokeCap.round,
                              dashPattern: const [10, 4],
                              child: Container(
                                width: double.infinity,
                                height: 150,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20)),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(
                                      Icons.image_outlined,
                                      size: 40,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "Select Product Images",
                                      style: TextStyle(
                                          fontSize: 15, color: Colors.grey),
                                    )
                                  ],
                                ),
                              )),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    CustomTextField(
                        controller: productNameController,
                        hintText: "Product Name"),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        controller: descriptionController,
                        hintText: "Decription",
                        maxLines: 7),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: priceController,
                      hintText: "Price in Rupees",
                      type: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                      controller: quanitiyController,
                      hintText: "Quantity",
                      type: TextInputType.number,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: DropdownButton(
                        value: currentCaterory,
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: category.map((String e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            currentCaterory = newValue!;
                          });
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomButtom(
                      text: "Sell",
                      onTap: sellProduct,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ))),
    );
  }
}
