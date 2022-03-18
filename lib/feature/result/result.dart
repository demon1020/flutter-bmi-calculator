import 'package:bmi/feature/result/components/body_result.dart';
import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultScreen(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(ConstantTexts.kAPP_NAME),
        centerTitle: true,
      ),
      body: BodyResult(
          bmiResult: widget.bmiResult,
          resultText: widget.resultText,
          interpretation: widget.interpretation),
    );
  }
}
