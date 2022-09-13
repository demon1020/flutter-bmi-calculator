import 'package:hive/hive.dart';

part 'reminder_model.g.dart';

@HiveType(typeId: 1)
class Reminder extends HiveObject{
  Reminder({
    required this.quantity,
    required this.date,
    this.isEnabled = true,
    this.isCompleted = false,
    this.isSelected = false,
  });
  @HiveField(0)
  int quantity;
  @HiveField(1)
  DateTime date;
  @HiveField(2)
  bool isEnabled;
  @HiveField(3)
  bool isCompleted;
  @HiveField(4)
  bool isSelected;

  factory Reminder.fromJson(Map<String, dynamic> json) => Reminder(
    quantity: json["quantity"],
    date: DateTime.parse(json["date"]),
    isEnabled: json["isEnabled"],
    isCompleted: json["isCompleted"],
    isSelected: json["isSelected"],
  );

  Map<String, dynamic> toJson() => {
    "quantity": quantity,
    "date": date.toIso8601String(),
    "isEnabled": isEnabled,
    "isCompleted": isCompleted,
    "isSelected": isSelected,
  };
}