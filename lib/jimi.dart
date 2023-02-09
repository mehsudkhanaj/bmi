import 'dart:async';

import 'package:bmi/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class jimiScreen extends StatefulWidget{
  @override
  State<jimiScreen> createState() => _jimiScreenState();
}

class _jimiScreenState extends State<jimiScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(),));
      

    });

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Container(
          width: 400,
            height: 500,
            child: Image.asset('assets/images/2.jpeg')),
      ),

    );

  }
}