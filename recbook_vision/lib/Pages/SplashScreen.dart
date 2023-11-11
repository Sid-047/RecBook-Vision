import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:recbook_vision/Pages/LandingPage.dart';

class SplashScreen extends StatefulWidget{
    @override
    _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
    @override 
    void initState(){
        super.initState();
        _navigateToHome();
    }
    void _navigateToHome() async {
        await Future.delayed(Duration(seconds: 3));
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => LandingPage()),
        );
    }
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.black,
            body: Center(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    'RecBook Vision',
                    style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()
                        ..shader = ui.Gradient.linear(
                        const Offset(0, 70),
                        const Offset(150, 20),
                        <Color>[
                            Colors.white,
                            Colors.limeAccent[400]!,
                        ],
                        ),
                    ),
                ),
                SizedBox(height: 15),
                Container(
                    width: 100,
                    child: LinearProgressIndicator(
                    minHeight: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                ),
                ],
            ),
            ),
        );
    }
}