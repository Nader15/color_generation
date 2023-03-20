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
  bool animation = false;

  @override
  void initState() {
    super.initState();
  }

  List<Color> _colors = [Colors.white];
  Timer? _timer;
  makeColorAnimation(){
    setState(() {
      animation = !animation;
    });
    if(animation){
      _timer = Timer.periodic(const Duration(seconds: 1), (_) {
        final random = math.Random();
        final newColor = Color.fromRGBO(
          random.nextInt(256),
          random.nextInt(256),
          random.nextInt(256),
          1,
        );
        setState(() {
          _colors.add(newColor);
        });
      });
    }else{
      _timer?.cancel();
    }
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
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        _setRandomColor();
      },
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: (){
            makeColorAnimation();
          },
          child: Icon(animation?Icons.pause:Icons.play_arrow),
        ),
        body: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: animation?_colors.last:_backgroundColor,
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