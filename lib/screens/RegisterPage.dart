import 'package:chit_chat/screens/HomePage.dart';
import 'package:chit_chat/services/authservices.dart';
import 'package:flutter/material.dart';

import '../controllers/MyButton.dart';
import '../controllers/MyTextField.dart';



class RegisterPage extends StatefulWidget {

  RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController =TextEditingController();

  final TextEditingController passwordController =TextEditingController();

  final TextEditingController usernameController =TextEditingController();

  bool isLoading =false;

  AuthService authService = AuthService();

  Future<void>register()async{
    setState(() {
      isLoading = true;
    });

    final username = usernameController.text.trim();
    final email = emailController.text.trim();
    final password=passwordController.text.trim();

    final user = await authService.register(username, email, password);
    setState(() {
      isLoading = false;
    });
    if(user!=null){
      Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => HomePage()),);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                controller: usernameController,
                obscureText: true,
                hinttext: 'username',

              ),
              SizedBox(
                height: 20,
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
              MyButton(text: 'Register'),
              SizedBox(
                height: 20,
              ),

              Row(
                  children: [
                    Text(' You are a memeber?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color:Theme.of(context).colorScheme.primary,
                ),),
                    Center(
                      child: Text(' Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color:Theme.of(context).colorScheme.primary,
                        ),),
                    ),
                  ]

              )
            ],

        ),
      ),
    );;
  }
}
