import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/home/screens/home_screen.dart';
import 'package:pets_mall/common/widgets/bottom_bar.dart';
import 'package:pets_mall/constant/err_handling.dart';
import 'package:pets_mall/constant/utils.dart';
import 'package:pets_mall/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:pets_mall/provider/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  // http://192.168.159.157:2000 mobile
  // http://192.168.137.19:2000
  // http://192.168.88.157:2000
  String uri = "http://192.168.88.157:2000";
  void signUpUser(
      {required BuildContext context,
      required String email,
      required String password,
      required String name}) async {
    try {
      User user = User(
          id: "",
          name: name,
          password: password,
          email: email,
          address: "",
          type: "",
          token: "");

      http.Response res = await http.post(Uri.parse('$uri/api/signup'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, "Account Created! Login with same credentials!");
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      http.Response res = await http.post(Uri.parse('$uri/api/signin'),
          body: jsonEncode({'email': email, 'password': password}),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandling(
          response: res,
          context: context,
          onSuccess: () async {
            SharedPreferences pref = await SharedPreferences.getInstance();
            // ignore: use_build_context_synchronously
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            await pref.setString(
              'x-auth-token',
              jsonDecode(res.body)['token'],
            );
            // ignore: use_build_context_synchronously
            Navigator.pushNamedAndRemoveUntil(
                context, BottomBar.routeName, (route) => false);
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString("x-auth-token");

      if (token == null) {
        pref.setString('x-auth-token', "");
      }

      var tokenRes = await http.post(Uri.parse("$uri/tokenIsValid"),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=utf-8',
            'x-auth-token': token!
          });

      var response = jsonDecode(tokenRes.body);
      if (response == true) {
        http.Response userRes = await http.get(Uri.parse('$uri/'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=utf-8',
              'x-auth-token': token
            });

        // ignore: use_build_context_synchronously
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
