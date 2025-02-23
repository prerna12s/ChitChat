import 'package:chit_chat/controllers/MyButton.dart';
import 'package:chit_chat/screens/HomePage.dart';
import 'package:chit_chat/services/authservices.dart';
import 'package:flutter/material.dart';

import '../controllers/MyTextField.dart';


class LoginPage extends StatefulWidget {

   LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =TextEditingController();

  final TextEditingController passwordController =TextEditingController();

  bool isLoading =false;

   //object of class
   AuthService authService =AuthService();


   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkloginstatus();
  }
Future<void>checkloginstatus()async {
      bool check=await authService.isLoggedIn();
      if(check){
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );

      }
      else {
        // go to register
      }
}
   Future<void> login() async{
     setState(() {
       isLoading = true;
     });
     final email = emailController.text.trim();
     final password=passwordController.text.trim();


       final user = await authService.login(email, password);
       setState(() {
         isLoading = false;
       });
       if (user != null) {
         //  Navigate to Home Screen after successful login
         Navigator.pushReplacement(
           context,
           MaterialPageRoute(builder: (context) => HomePage()),
         );}
         else{
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(content: Text("Login failed. Please check your credentials!")),
         );
       }





   }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Padding(
        padding: EdgeInsets.only(left: 20,right: 20,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome back !',style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontSize: 40,
            ),),
            SizedBox(
                height:40,
            ),
            Icon(Icons.message_rounded,size: 100,),
            SizedBox(
              height: 30,
            ),

            MyTextField(
               controller: emailController,
              obscureText: false,
              hinttext:'email',

            ),

            SizedBox(
              height: 20,
            ),
            MyTextField(
              controller: passwordController,
              obscureText: true,
              hinttext: 'password',

            ),
            SizedBox(
              height: 20,
            ),
            MyButton(text: 'Button'),

            Row(
              children: [
                Text('Not a memeber'),
                Text('Register Now',
                  style: TextStyle(
                      color:Theme.of(context).colorScheme.primary,
                  ),),
              ]

            )
          ]

        ),
      ),
    );

  }
}
