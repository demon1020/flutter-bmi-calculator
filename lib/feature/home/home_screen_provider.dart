import 'package:flutter/material.dart';
import 'package:bmi/models/reminder_model.dart';
import 'package:bmi/repository/reminder_repository.dart';

class HomeScreenProvider extends ChangeNotifier{
  late TimeOfDay selectedTime;
  late bool showDelete;
  late DateTime dateTime;
  late int waterQuantity;
  late String formattedTimeOfDay;
  late List<Reminder> reminderList;
  late List<Reminder> deleteList;

  init(BuildContext context) async {
    deleteList = [];
    formattedTimeOfDay = "";
    showDelete = false;
    selectedTime = TimeOfDay.now();
    dateTime = DateTime.now();
    reminderList = [];
    waterQuantity = 250;
    reminderList = [];

    await fetchReminders();
    formatTime(context);
  }

  fetchReminders() async {
    List<Reminder> _reminderList = await ReminderRepository().getReminder();
    reminderList = [..._reminderList];
    notifyListeners();
  }

  formatTime(BuildContext context){
    final localizations = MaterialLocalizations.of(context);
    formattedTimeOfDay =
        localizations.formatTimeOfDay(selectedTime);
  }
  addReminder(Reminder reminder) async {

    await ReminderRepository().addReminder(reminder);
    reminderList.add(reminder);
    notifyListeners();
  }

  deleteReminder(int index) async{
    reminderList.removeAt(index);
    // await Repository().removeReminder();
    notifyListeners();
  }
}