import 'package:flutter/material.dart';


class MyButton extends StatefulWidget {
  final String text;
  const MyButton({super.key, required this.text});

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration:BoxDecoration(
         color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.all(
        20
      ),

      child: Center(
        child: Text(
          widget.text,
          style: TextStyle(
            color:Theme.of(context).colorScheme.primary,
          ),
        ),
      ),


    );
  }
}
