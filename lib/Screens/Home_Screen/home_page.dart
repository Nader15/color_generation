import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  void initState() {
    super.initState();
  }


  Color _backgroundColor = Colors.white;
  void _setRandomColor() {
    setState(() {
      // Generate a random color using the Random class
      final random = math.Random();
      _backgroundColor = Color.fromRGBO(
        random.nextInt(256),
        random.nextInt(256),
        random.nextInt(256),
        1,
      );
    });
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _setRandomColor();
      },
      child: Scaffold(
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: _backgroundColor,
          curve: Curves.easeInOut,
          child: Center(
            child: Text("Hello there",style: textStyle,),
          ),
        ),
      ),
    );
  }
  TextStyle textStyle = const TextStyle(fontSize: 20);
}