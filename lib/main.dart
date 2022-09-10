import 'package:bmi/feature/home/home_screen.dart';
import 'package:bmi/feature/home/home_screen_provider.dart';
import 'package:bmi/feature/user_detail/user_detail_screen.dart';
import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'models/reminder_model.dart';
import 'models/user_model.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(ReminderAdapter());
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('user');
  await Hive.openBox<Reminder>('reminder');

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: MyTheme.kDark,
        title: ConstantTexts.kAPP_NAME,
        home: HomeScreen(),
        // home: UserDetailScreen(),
        // initialRoute: "/",
        // routes: {
        //   '/': (context) => HomeScreen(),
        //   'rResult': (context) => ResultScreen(),
        // },
      ),
    );
  }
}
