import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';

class MyRoundButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData icon;
  MyRoundButton({required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      fillColor: MyColor.kRoundButtonColor,
      constraints: BoxConstraints.tightFor(
        height: 56,
        width: 56,
      ),
      elevation: 0,
      child: Icon(icon),
      onPressed: onPressed,
    );
  }
}
