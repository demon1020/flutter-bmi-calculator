import 'package:bmi/feature/reminder/reminder_provider.dart';
import 'package:bmi/feature/user_detail/components/slider_content.dart';
import 'package:bmi/resources/constants.dart';
import 'package:bmi/widgets/custom_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:bmi/feature/home/home_screen.dart';
import 'package:bmi/models/reminder_model.dart';
import 'package:bmi/services/local_notification_service.dart';

import '../../services/local_notification_service.dart';
import '../home/home_screen.dart';

class ReminderScreen extends StatefulWidget {
  ReminderScreen({Key? key}) : super(key: key);

  @override
  State<ReminderScreen> createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  @override
  void initState() {
    NotificationApi.init(initScheduled: true);
    listenLocalNotifications();
    final provider =
        Provider.of<ReminderScreenProvider>(context, listen: false);
    provider.init(context);

    super.initState();
  }

  listenLocalNotifications() {
    NotificationApi.onNotifications.stream.listen(onClickLocalNotification);
  }

  onClickLocalNotification(String? payload) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ReminderScreenProvider>(
        builder: (context, reminderProvider, _) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'ADD REMINDER',
          ),
          elevation: 0,
        ),
        body: SafeArea(
          child: ListView.separated(
            separatorBuilder: (context, i) {
              return Divider();
            },
            itemBuilder: (context, index) {
              final item = reminderProvider.reminderList[index];
              DateTime now = item.date;
              String formattedTime = DateFormat.jm().format(now);
              return ListTile(
                onLongPress: () {
                  reminderProvider.showDelete = true;
                  setState(() {});
                },
                onTap: () async {
                  await reminderProvider.pickTime(context);
                  setState(() {});
                },
                title: Text(formattedTime),
                trailing: reminderProvider.showDelete
                    ? Checkbox(
                        value: item.isSelected,
                        onChanged: (value) {
                          item.isSelected = !item.isSelected;
                          setState(() {});
                        },
                      )
                    : Switch(
                        value: item.isEnabled,
                        onChanged: (bool value) {
                          item.isEnabled = !item.isEnabled;

                          setState(() {});
                        },
                      ),
              );
            },
            itemCount: reminderProvider.reminderList.length,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (reminderProvider.showDelete) {
              reminderProvider.reminderList.forEach((element) {
                int index = reminderProvider.reminderList
                    .indexWhere((element) => element.isSelected == true);
                reminderProvider.deleteReminder();
              });

              setState(() {
                reminderProvider.showDelete = false;
              });
            } else {
              openBottomSheet(context, reminderProvider);
            }
          },
          child: reminderProvider.showDelete
              ? Icon(Icons.delete)
              : Icon(Icons.add),
        ),
      );
    });
  }

  Future openBottomSheet(
      BuildContext context, ReminderScreenProvider reminderProvider) {
    return showModalBottomSheet(
      backgroundColor: MyColor.kPrimaryColor,
      context: context,
      builder: (context) {
        return ListView(
          children: <Widget>[
            MyCard(
              child: Column(
                children: [
                  Text(
                    "SELECT TIME",
                    style: MyTheme.kMyTextStyle,
                  ),
                  Text(
                    reminderProvider.formattedTimeOfDay,
                    style: MyTheme.kNumberStyle,
                  ),
                ],
              ),
              onPressed: () => reminderProvider.pickTime(context),
            ),

            MyCard(
              child: SliderContent(
                title: "SELECT QUANTITY",
                unit: "ML",
                value: reminderProvider.waterQuantity,
                onChanged: (newValue) =>
                    reminderProvider.updateWaterQuantity(newValue.round()),
              ),
            ),

            SizedBox(
              height: 20,
            ),
            // WaterIndicator(
            //   onChanged: (double value) {
            //     provider.waterQuantity = value.round();
            //   },
            //   value: provider.waterQuantity,
            // ),
            InkWell(
              onTap: () {
                // NotificationApi.showNotification(
                //     title: "Reminder",
                //     body: "This is a test reminder",
                //     payload: "sarah.abs");

                reminderProvider.addReminder(
                  Reminder(
                    quantity: 250,
                    date: reminderProvider.dateTime,
                  ),
                );

                // NotificationApi.showScheduledNotification(
                //     title: "Scheduled notify",
                //     body: "This is a test reminder",
                //     payload: "sarah.abs",
                //     scheduledDate: reminderProvider.dateTime);
                NotificationApi.showDailyNotification(
                    title: "Scheduled notify",
                    body: "This is daily reminder",
                    payload: "sarah.abs",
                    scheduledDate: reminderProvider.dateTime,
                );
                SnackBar(
                  content: Text("scheduled notification for 10 seconds"),
                );

                Navigator.pop(context);
                debugPrint("Add Now Clicked");
              },
              child: Container(
                height: 50,
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  'Add Now',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
