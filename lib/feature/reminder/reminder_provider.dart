import 'package:flutter/material.dart';
import 'package:bmi/models/reminder_model.dart';
import 'package:bmi/repository/reminder_repository.dart';
import 'package:intl/intl.dart';

class ReminderScreenProvider extends ChangeNotifier{
  late TimeOfDay selectedTime;
  late String formattedTimeOfDay;
  late bool showDelete;
  late DateTime dateTime;
  late int waterQuantity;
  late List<Reminder> reminderList;
  late List<Reminder> deleteList;

  init(BuildContext context) async {
    deleteList = [];
    showDelete = false;
    selectedTime = TimeOfDay.now();
    dateTime = DateTime.now();
    reminderList = [];
    waterQuantity = 150;
    reminderList = [];

    await fetchReminders();
    formatTime(context);
  }

  formatTime(BuildContext context){
    final localizations = MaterialLocalizations.of(context);
    formattedTimeOfDay =
        localizations.formatTimeOfDay(selectedTime);
    notifyListeners();
  }

  updateWaterQuantity(int quantity){
    waterQuantity = quantity;
    notifyListeners();
  }

  deleteSelection(int index){
    reminderList[index].isSelected = !reminderList[index].isSelected;
    notifyListeners();
  }

  Future<void> pickTime(BuildContext context) async {
    final TimeOfDay? result =
    await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (result != null) {
      formattedTimeOfDay = formatTimeOfDay(result);
    }
    notifyListeners();
  }

  String formatTimeOfDay(TimeOfDay tod) {
    dateTime = DateTime(dateTime.year, dateTime.month, dateTime.day, tod.hour, tod.minute);
    final format = DateFormat.jm();  //"6:00 AM"
    return format.format(dateTime);
  }

  fetchReminders() async {
    List<Reminder> _reminderList = await ReminderRepository().getReminder();
    reminderList = [..._reminderList];
    notifyListeners();
  }

  addReminder(Reminder reminder) async {

    await ReminderRepository().addReminder(reminder);
    reminderList.add(reminder);
    notifyListeners();
  }

  deleteReminder() async{

    for(int index = 0; index < reminderList.length;index++){
      if(reminderList[index].isSelected){
        await ReminderRepository().removeReminder(index);
      }
    }
    await fetchReminders();
    notifyListeners();
  }
}