import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget{
  String res ="";
  ChatScreen({required this.res}) ;
  @override
  Widget build(BuildContext context) => Scaffold(
    body: Container(
      height: double.infinity,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              res,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black ,
              fontStyle: FontStyle.italic,
              fontSize: 40,
              fontWeight: FontWeight.bold
            ),
          ),
        ],
      ),
    ),
  ) ;
}