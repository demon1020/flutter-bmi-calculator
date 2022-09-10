import 'package:flutter/material.dart';
import 'package:bmi/models/reminder_model.dart';
import 'package:bmi/repository/repository.dart';

class HomeScreenProvider extends ChangeNotifier {
  late TimeOfDay selectedTime;
  late String formattedTimeOfDay;
  late int waterQuantity;
  late List<Reminder> reminderList;

  init() async {
    selectedTime = TimeOfDay.now();
    formattedTimeOfDay = "";
    waterQuantity = 250;
    reminderList = [];

    await fetchReminders();
  }

  fetchReminders() async {
    List<Reminder> _reminderList = await Repository().getReminder();
    _reminderList.where((element) => element.isEnabled).toList();
    reminderList = [..._reminderList];
    notifyListeners();
  }

  addReminder(Reminder reminder) async {
    await Repository().addReminder(reminder);
    reminderList.add(reminder);
    notifyListeners();
  }

  deleteReminder(int index) async {
    reminderList.removeAt(index);
    await Repository().removeReminder(index);
    notifyListeners();
  }
}
