import 'package:bmi/resources/constants.dart';
import 'package:flutter/material.dart';
import '../../../models/reminder_model.dart';
import '../../../services/local_notification_service.dart';
import '../home_screen_provider.dart';

Future AddReminderSheet(
    {required BuildContext context,
    required HomeScreenProvider homeScreenProvider}) {
  return showModalBottomSheet(
    isScrollControlled: false,
    enableDrag: false,
    isDismissible: false,
    backgroundColor: MyColor.kPrimaryColor,
    context: context,
    builder: (context) {
      return Container(
        height: double.maxFinite,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              'Add Reminder',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
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

                homeScreenProvider.addReminder(
                  Reminder(
                    quantity: 250,
                    date: DateTime.now(),
                    isEnabled: true,
                    isCompleted: false,
                  ),
                );

                NotificationApi.showScheduledNotification(
                    title: "Scheduled notify",
                    body: "This is a test reminder",
                    payload: "sarah.abs",
                    scheduledDate: DateTime.now().add(Duration(seconds: 10)));
                SnackBar(
                  content: Text("scheduled notification for 10 seconds"),
                );

                Navigator.pop(context);
                debugPrint("Add Now Clicked");
              },
              child: Container(
                height: 50,
                width: double.infinity,
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
        ),
      );
    },
  );
}
