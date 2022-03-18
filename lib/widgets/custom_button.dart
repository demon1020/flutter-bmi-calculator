import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';

const bottomContainerHeight = 60.0;

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  CustomButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        color: MyColor.kButtonColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottomContainerHeight,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
