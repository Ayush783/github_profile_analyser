import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = Duration(seconds: 3);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacementNamed(context, 'home');
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Colors.grey[700], Colors.white],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height,
            width: size.width,
            child: Image.asset(
              'images/ssimage.jpg',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            left: size.width*0.3,
            bottom: size.width*0.3,
            child: Text(
        'Github Manager',
        style: new TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            foreground: Paint()..shader = linearGradient),
      )
          ),
        ],
      ),
    );
  }
}
