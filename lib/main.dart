import 'package:flutter/material.dart';
import 'package:pets_mall/Screen/admin/screen/admin_screen.dart';
import 'package:pets_mall/Screen/auth/screens/auth_screen.dart';
import 'package:pets_mall/Screen/auth/services/auth_service.dart';
import 'package:pets_mall/Screen/home/screens/home_screen.dart';
import 'package:pets_mall/common/widgets/bottom_bar.dart';
import 'package:pets_mall/provider/user_provider.dart';
import 'package:pets_mall/router.dart';
import 'package:provider/provider.dart';
import 'constant/globalVarable.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet Cart',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            elevation: 0, iconTheme: IconThemeData(color: Colors.black)),
        scaffoldBackgroundColor: Colors.grey[100],
        primarySwatch: GlobalVariable.myBlue,
      ),
      onGenerateRoute: ((settings) => generateRoute(settings)),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == "user"
              ? const BottomBar()
              : const AdminScreen()
          : const AuthScreen(),
    );
  }
}
