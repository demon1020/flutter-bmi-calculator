import 'package:flutter/material.dart';

import '../resources/constants.dart';

showSnackBar({
  required BuildContext context,
  required String message,
  GlobalKey<ScaffoldState>? key,
  Duration? duration,
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      duration: duration != null ? duration : Duration(milliseconds: 1500),
      width: MediaQuery.of(context).size.width - 40,
      behavior: SnackBarBehavior.floating,
      backgroundColor: MyColor.kPrimaryColor,
      key: key,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, color: MyColor.kWhiteColor),
      ),
    ),
  );
}
