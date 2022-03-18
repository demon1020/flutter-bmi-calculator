import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';

class MySlider extends StatelessWidget {
  final int value;
  final ValueChanged<double>? onChanged;
  MySlider({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Colors.white,
        thumbColor: MyColor.kButtonColor,
        overlayColor: MyColor.kOverlayColor,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: 14),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 25),
      ),
      child: Slider(
        value: value.toDouble(),
        min: 100,
        max: 200,
        onChanged: onChanged,
      ),
    );
  }
}
