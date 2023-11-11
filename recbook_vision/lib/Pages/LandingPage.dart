import 'package:flutter/material.dart';
import 'package:recbook_vision/Pages/FaceSignUpPage.dart';

class LandingPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RecBook Vision",
        style: TextStyle(
          color: Colors.white,
          fontSize: 24,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              child: LinearProgressIndicator(
                  minHeight: 3,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ),
          ]
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => FaceSignUpPage()));
                },
                child: Text(
                  'SignUp Face',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.limeAccent[400],
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              height: 50,
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                  //Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'RollUp Face',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.limeAccent[400],
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                ),
              ),
            ),
          ]
        )
      ),
    );
  }
}