import 'package:bmi/resources/constants.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:bmi/widgets/custom_card.dart';
import 'package:flutter/material.dart';

class BodyResult extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  BodyResult(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  Color result() {
    if (resultText == 'Normal') {
      return MyColor.kResultColor;
    } else if (resultText == 'Over Weight') {
      return MyColor.kResultColorOver;
    } else {
      return MyColor.kResultColorUnder;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,
            child: Text(
              ConstantTexts.kResult.toUpperCase(),
              style: MyTheme.kTitleTextStyle,
            ),
          ),
        ),
        Expanded(
          flex: 5,
          child: MyCard(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'NORMAL RANGE \n 18.5 - 25',
                  textAlign: TextAlign.center,
                  style: MyTheme.kRangeTextStyle,
                ),
                Text(
                  bmiResult,
                  style: MyTheme.kResultNumberStyle,
                ),
                Text(
                  resultText.toUpperCase(),
                  style: MyTheme.kResultTextStyle.copyWith(
                    color: result(),
                  ),
                ),
                Text(
                  interpretation.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: MyTheme.kMyTextStyle,
                ),
              ],
            ),
          ),
        ),
        CustomButton(
          label: ConstantTexts.kBUTTON_TEXT_RE_CAL,
          onTap: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
