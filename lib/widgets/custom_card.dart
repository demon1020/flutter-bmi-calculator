import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final Color? color;
  final Widget? child;
  final GestureTapCallback? onPressed;
  final bool isSelected;

  MyCard(
      {this.color = MyColor.kActiveCardColor,
      this.child,
      this.onPressed,
      this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        child: child,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: isSelected
              ? Border.all(color: MyColor.kResultColor)
              : Border.all(),
        ),
      ),
    );
  }
}
