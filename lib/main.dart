import 'package:chit_chat/screens/HomePage.dart';
import 'package:chit_chat/screens/LoginPage.dart';
import 'package:chit_chat/screens/RegisterPage.dart';
import 'package:chit_chat/services/authservices.dart';
import 'package:chit_chat/themes/lightMode.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  bool isLoggedin = await AuthService().isLoggedIn();

  runApp( MyApp(isLoggedin:isLoggedin ));
}

class MyApp extends StatelessWidget {
  final bool isLoggedin;
  const MyApp({super.key, required this.isLoggedin});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChitChat',
        home:isLoggedin?HomePage():RegisterPage(),
      theme: lightMode,

    );

  }
}
