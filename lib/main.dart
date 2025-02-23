import 'package:chit_chat/screens/HomePage.dart';
import 'package:chit_chat/screens/LoginPage.dart';
import 'package:chit_chat/screens/RegisterPage.dart';
import 'package:chit_chat/services/authservices.dart';
import 'package:chit_chat/themes/lightMode.dart';
import 'package:flutter/material.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp( ));
}

class MyApp extends StatefulWidget {

  const MyApp({super.key,});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool? isLoggedIn;
  @override
  void initState() {
    super.initState();
    _checkAuthStatus();
  }
  Future<void> _checkAuthStatus() async {
    bool loggedIn = await AuthService().isLoggedIn();
    setState(() {
      isLoggedIn = loggedIn;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChitChat',
        home:isLoggedIn==null?
        Scaffold(
          body: Center(
            child: CircularProgressIndicator(),
          ),
        ):(isLoggedIn!?HomePage():RegisterPage()),
      theme: lightMode,

    );

  }
}
