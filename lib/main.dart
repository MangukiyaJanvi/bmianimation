import 'package:bmianimation/screens/homescreen/view/home_screen.dart';
import 'package:bmianimation/screens/splashscreen/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main()
{
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => SplashScreen(),
        'home':(context) => HomeScreen(),
      },
    ),
  );
}