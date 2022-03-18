import 'package:bmi/feature/calculate.dart';
import 'package:bmi/feature/home/components/icon_content.dart';
import 'package:bmi/feature/home/components/slider_content.dart';
import 'package:bmi/feature/home/model/enum_gender.dart';
import 'package:bmi/feature/result/result.dart';
import 'package:bmi/resources/constants.dart';
import 'package:bmi/widgets/custom_button.dart';
import 'package:bmi/widgets/custom_card.dart';
import 'package:bmi/widgets/custom_round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BodyHome extends StatefulWidget {
  const BodyHome({Key? key}) : super(key: key);

  @override
  State<BodyHome> createState() => _BodyHomeState();
}

class _BodyHomeState extends State<BodyHome> {
  Gender? selectedGender;
  int height = 150;
  int weight = 50;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MyCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: selectedGender == Gender.male
                      ? MyColor.kActiveCardColor
                      : MyColor.kInactiveCardColor,
                  child: IconContent(
                    label: ConstantTexts.kGENDER_MALE,
                    icon: FontAwesomeIcons.mars,
                  ),
                ),
              ),
              Expanded(
                child: MyCard(
                  onPressed: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: selectedGender == Gender.female
                      ? MyColor.kActiveCardColor
                      : MyColor.kInactiveCardColor,
                  child: IconContent(
                    label: ConstantTexts.kGENDER_FEMALE,
                    icon: FontAwesomeIcons.venus,
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: MyCard(
            child: SliderContent(
              value: height,
              onChanged: (newValue) {
                setState(() {
                  height = newValue.round();
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: MyCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantTexts.kWEIGHT,
                        style: MyTheme.kMyTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: MyTheme.kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyRoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyRoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: MyCard(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        ConstantTexts.kAGE,
                        style: MyTheme.kMyTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: MyTheme.kNumberStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          MyRoundButton(
                            icon: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          MyRoundButton(
                            icon: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        CustomButton(
          label: ConstantTexts.kBUTTON_TEXT_CAL,
          onTap: () {
            CalculateBMI cal = CalculateBMI(height: height, weight: weight);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ResultScreen(
                  bmiResult: cal.calculateResultBMI(),
                  resultText: cal.getResult(),
                  interpretation: cal.getInterpretation(),
                ),
              ),
            );
            // Navigator.pushNamed(context, 'rResult', arguments: {
            //   'bmiResult': cal.calculateResultBMI,
            //   'resultText': cal.getResult,
            //   'interpretation': cal.getInterpretation
            // });
          },
        ),
      ],
    );
  }
}
