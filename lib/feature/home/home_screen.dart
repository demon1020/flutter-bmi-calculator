import 'package:bmi/feature/home/components/body_home.dart';
import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(ConstantTexts.kAPP_NAME),
      ),
      body: BodyHome(),
    );
  }
}
