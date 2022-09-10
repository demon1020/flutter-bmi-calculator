import 'package:flutter/material.dart';

//Theme
class MyTheme {
  static ThemeData kDark = ThemeData.dark().copyWith(
    primaryColor: MyColor.kPrimaryColor,
    scaffoldBackgroundColor: MyColor.kPrimaryColor,
    appBarTheme: AppBarTheme(
      color: MyColor.kPrimaryColor,
    ),
  );

  static TextStyle kMyTextStyle = TextStyle(
    fontSize: 18,
    color: MyColor.kTextColor,
  );

  static TextStyle kTitleTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    // color: MyColor.kTextColor,
  );

  static TextStyle kRangeTextStyle = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: MyColor.kResultColor,
  );

  static TextStyle kResultTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    color: MyColor.kResultColor,
  );

  static TextStyle kNumberStyle = TextStyle(
    fontSize: 60,
    fontWeight: FontWeight.w900,
  );

  static TextStyle kResultNumberStyle = TextStyle(
    fontSize: 80,
    fontWeight: FontWeight.bold,
  );
}

//Colors
class MyColor {
  static const Color kPrimaryColor = Color(0xFF0A0E21);
  static const Color kActiveCardColor = Color(0xFF1D1E33);
  static const Color kInactiveCardColor = Color(0xFF111328);
  static const Color kTextColor = Color(0xFF8D8E98);
  static const Color kOverlayColor = Color(0x29EB1555);

  static const Color kResultColor = Color(0xFF24D876);
  static const Color kResultColorUnder = Colors.orangeAccent;
  static const Color kResultColorOver = Color(0xFFD21A1A);

  static const Color kButtonColor = Color(0xFFEB1555);
  static const Color kRoundButtonColor = Color(0xFF4C4F5E);
}

//Strings
class ConstantTexts {
  static const String kAPP_NAME = "THIRSTY SIP";
  static const String kGENDER_MALE = "MALE";
  static const String kGENDER_FEMALE = "FEMALE";
  static const String kHEIGHT = "HEIGHT";
  static const String kWEIGHT = "WEIGHT";
  static const String kAGE = "AGE";
  static const String kUNIT_HEIGHT = "CM";
  static const String kUNIT_WEIGHT = "KG";
  static const String kResult = "Your Result";

  static const String kBUTTON_TEXT_CAL = "SAVE";
  static const String kBUTTON_TEXT_RE_CAL = "RE-CALCULATE";
}
