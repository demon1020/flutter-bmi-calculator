import 'package:bmi/resources/constants.dart';
import 'package:bmi/widgets/custom_slider.dart';
import 'package:flutter/material.dart';

class SliderContent extends StatelessWidget {
  final int value;
  final ValueChanged<double>? onChanged;
  final String title;
  final String unit;
  SliderContent({required this.value, required this.onChanged, required this.title, required this.unit});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: MyTheme.kMyTextStyle,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              value.toString(),
              style: MyTheme.kNumberStyle,
            ),
            Text(
              unit,
              style: MyTheme.kMyTextStyle,
            ),
          ],
        ),
        MySlider(value: value, onChanged: onChanged)
      ],
    );
  }
}
