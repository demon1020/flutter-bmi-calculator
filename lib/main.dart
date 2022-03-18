import 'package:bmi/feature/home/home_screen.dart';
import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyTheme.kDark,
      title: ConstantTexts.kAPP_NAME,
      home: HomeScreen(),
      // initialRoute: "/",
      // routes: {
      //   '/': (context) => HomeScreen(),
      //   'rResult': (context) => ResultScreen(),
      // },
    );
  }
}
