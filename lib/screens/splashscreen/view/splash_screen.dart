import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0XFF0F1537),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.white54,
                          blurRadius: 2,
                          spreadRadius: 5),
                    ]),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://logowik.com/content/uploads/images/329_handheart.jpg"),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "BMI CALCULATOR",
                style: TextStyle(
                    color: Colors.white70, fontSize: 30, wordSpacing: 2),
              ),
              SizedBox(
                height: 280,
              ),
              CircularProgressIndicator(
                color: Colors.pink,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Check Your BMI",
                style: TextStyle(color: Colors.white70, fontSize: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
