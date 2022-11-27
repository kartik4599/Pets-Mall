import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/auth/services/auth_service.dart';
import 'package:pets_mall/common/widgets/custom_button.dart';
import 'package:pets_mall/constant/globalVarable.dart';
import '../../../common/widgets/custom_textfiled.dart';

enum Auth { signin, signup }

class AuthScreen extends StatefulWidget {
  static const routeName = '/auth-screen';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  Auth _auth = Auth.signin;
  final _signUpFormKey = GlobalKey<FormState>();
  final _signInFormKey = GlobalKey<FormState>();
  final AuthService authService = AuthService();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _nameController.dispose();
    _passwordController.dispose();
  }

  void signUpUser() {
    authService.signUpUser(
        email: _emailController.text,
        context: context,
        password: _passwordController.text,
        name: _nameController.text);
  }

  void signInUser() {
    authService.signInUser(
        email: _emailController.text,
        context: context,
        password: _passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: GlobalVariable.myGrey,
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 10,
              ),
              ListTile(
                tileColor:
                    _auth == Auth.signup ? Colors.white : GlobalVariable.myGrey,
                title: const Text(
                  "Create Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signup,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                  activeColor: GlobalVariable.blue,
                ),
              ),
              if (_auth == Auth.signup)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signUpFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          hintText: "Name",
                          controller: _nameController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: "E-Mail",
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: "Password",
                          controller: _passwordController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButtom(
                            text: "Sign-Up",
                            onTap: () {
                              if (_signUpFormKey.currentState!.validate()) {
                                signUpUser();
                              }
                            })
                      ],
                    ),
                  ),
                ),
              ListTile(
                tileColor:
                    _auth == Auth.signin ? Colors.white : GlobalVariable.myGrey,
                title: const Text(
                  "Sign-In Account",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                leading: Radio(
                  value: Auth.signin,
                  groupValue: _auth,
                  onChanged: (Auth? val) {
                    setState(() {
                      _auth = val!;
                    });
                  },
                  activeColor: GlobalVariable.blue,
                ),
              ),
              if (_auth == Auth.signin)
                Container(
                  padding: const EdgeInsets.all(8),
                  color: Colors.white,
                  child: Form(
                    key: _signInFormKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: "E-Mail",
                          controller: _emailController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextField(
                          hintText: "Password",
                          controller: _passwordController,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomButtom(
                            text: "Sign-Up",
                            onTap: () {
                              if (_signInFormKey.currentState!.validate()) {
                                signInUser();
                              }
                            })
                      ],
                    ),
                  ),
                ),
            ],
          ),
        )));
  }
}
