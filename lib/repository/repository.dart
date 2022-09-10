import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:bmi/models/reminder_model.dart';

class Repository {
  //creating a box reference for Reminder
  Box<Reminder> reminderBox = Hive.box('reminder');

  //getting all the Reminders from hive db
  Future<List<Reminder>> getReminder() async{
    List<Reminder> reminderList = reminderBox.values.toList();
    debugPrint("fetching all Reminders");
    return reminderList;
  }

  //adding the Reminder into the into the hive db
  Future<void> addReminder(Reminder reminder) async {
    await reminderBox.add(reminder);
    debugPrint("add Reminder ${reminder.isEnabled}");
  }

  //deleting the reminder
  Future<void> removeReminder(int index) async {
    reminderBox.deleteAt(index);
    debugPrint("remove Reminder");
  }
}