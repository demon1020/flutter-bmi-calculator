import 'package:bmi/models/reminder_model.dart';
import 'package:hive/hive.dart';

part 'user_model.g.dart';
@HiveType(typeId: 0)
class User extends HiveObject{
  User({
    required this.name,
    required this.gender,
    required this.age,
    required this.height,
    required this.weight,
    required this.dailyTarget,
    required this.autoReminder,
    required this.reminders,
  });
  @HiveField(0)
  String name;
  @HiveField(1)
  String gender;
  @HiveField(2)
  int age;
  @HiveField(3)
  int height;
  @HiveField(4)
  int weight;
  @HiveField(5)
  int dailyTarget;
  @HiveField(6)
  bool autoReminder;
  @HiveField(7)
  List<Reminder> reminders;

  factory User.fromJson(Map<String, dynamic> json) => User(
    name: json["name"],
    gender: json["gender"],
    age: json["age"],
    height: json["height"],
    weight: json["weight"],
    dailyTarget: json["dailyTarget"],
    autoReminder: json["autoReminder"],
    reminders: List<Reminder>.from(json["reminders"].map((x) => Reminder.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "gender": gender,
    "age": age,
    "height": height,
    "weight": weight,
    "dailyTarget": dailyTarget,
    "autoReminder": autoReminder,
    "reminders": List<dynamic>.from(reminders.map((x) => x.toJson())),
  };
}
