import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/user_model.dart';

class UserRepository {
  //creating a box reference for Reminder
  Box<User> userBox = Hive.box('user');

  //getting all the Reminders from hive db
  Future<User> getUser() async{
    User user = userBox.values.elementAt(0);
    debugPrint("fetching user");
    return user;
  }

  //adding the USER into the into the hive db
  Future<void> addUser(User user) async {
    await userBox.add(user);
    debugPrint("user added to db");
  }
}