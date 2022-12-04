import 'dart:io';
import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:flutter/cupertino.dart';
import 'package:pets_mall/constant/err_handling.dart';
import 'package:pets_mall/constant/globalVarable.dart';
import 'package:pets_mall/constant/utils.dart';
import 'package:pets_mall/models/product.dart';
import 'package:http/http.dart' as http;
import 'package:pets_mall/provider/user_provider.dart';
import 'package:provider/provider.dart';

class AdminServices {
  void sellProduct(
      {required BuildContext context,
      required String name,
      required String description,
      required double price,
      required double quantity,
      required String category,
      required List<File> images}) async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    try {
      final cloudnary = CloudinaryPublic("dv7krzlua", "o1ds5nzk");
      List<String> imageUrls = [];

      for (int i = 0; i < images.length; i++) {
        CloudinaryResponse res = await cloudnary
            .uploadFile(CloudinaryFile.fromFile(images[i].path, folder: name));
        imageUrls.add(res.secureUrl);
      }

      Product product = Product(
          name: name,
          description: description,
          price: price,
          quantity: quantity,
          category: category,
          images: imageUrls);

      http.Response res = await http.post(Uri.parse("$uri/admin/add-product"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            "x-auth-token": userProvider.user.token,
          },
          body: product.toJson());
      print(res.body.toString());
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, "Product Added Successfully");
            Navigator.pop(context);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
