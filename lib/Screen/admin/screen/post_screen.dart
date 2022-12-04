import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/admin/screen/add_product_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("product")),
      floatingActionButton: FloatingActionButton(
        onPressed: navigateToAddProduct,
        elevation: 20,
        tooltip: "Add a Product",
        child: Icon(Icons.add),
      ),
    );
  }
}
