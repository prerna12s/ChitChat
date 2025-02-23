import 'package:flutter/material.dart';


class MyTextField extends StatefulWidget {
   final String hinttext;
   final bool obscureText;
   final TextEditingController controller;
   const MyTextField({super.key, required this.hinttext, required this.obscureText, required this.controller});

  @override
  State<MyTextField> createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
       obscureText: widget.obscureText,
       controller: widget.controller,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color:Theme.of(context).colorScheme.tertiary,

          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          )
        ),
        fillColor:Theme.of(context).colorScheme.secondary,
        filled: true,
        hintText: widget.hinttext,
        hintStyle: TextStyle(
          color: Theme.of(context).colorScheme.primary,
        )
      ),

    );
  }
}
