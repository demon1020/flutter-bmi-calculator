import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future init({bool initScheduled = false}) async {
    final androidSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    final iosSettings = IOSInitializationSettings();
    final settings =
        InitializationSettings(android: androidSettings, iOS: iosSettings);

    // When app is close get details and then navigate to that particular screen
    final details = await _notifications.getNotificationAppLaunchDetails();
    if (details != null && details.didNotificationLaunchApp) {
      onNotifications.add(details.payload);
    }

    await _notifications.initialize(settings,
        onSelectNotification: (payload) async {
      onNotifications.add(payload);
    });

    if (initScheduled) {
      tz.initializeTimeZones();
      final locationName = await FlutterNativeTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(locationName));
    }
  }

  static Future _notificationDetails() async {
    const sound = "default_notification_sound.mp3";
    return NotificationDetails(
      android: AndroidNotificationDetails(
        "channel id", "channel name",
        // "channel description",
        playSound: true, //enable/disable notifications sounds
        sound: RawResourceAndroidNotificationSound(sound.split('.').first), //
        importance:
            Importance.max, //comment out if u don't want banner notification
      ),
      iOS: IOSNotificationDetails(
        presentSound: true, //enable/disable notifications sounds
        sound: sound,
      ),
    );
  }

  //on click notifications
  static Future showNotification(
      {int id = 0, String? title, String? body, String? payload}) async {
    return _notifications.show(
      id,
      title,
      body,
      await _notificationDetails(),
      payload: payload,
    );
  }

  //scheduled notifications
  static Future showScheduledNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledDate}) async {
    return _notifications.zonedSchedule(
      id,
      title,
      body,
      tz.TZDateTime.from(scheduledDate, tz.local),
      await _notificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  //scheduled daily notifications
  static Future showDailyNotification(
      {int id = 0,
      String? title,
      String? body,
      String? payload,
      required DateTime scheduledDate}) async {
    return _notifications.zonedSchedule(
      id,
      title,
      body,
      _scheduleDaily(Time(scheduledDate.hour,scheduledDate.minute)),
      await _notificationDetails(),
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  static tz.TZDateTime _scheduleDaily(Time time) {
    final now = tz.TZDateTime.now(tz.local);
    final scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      time.hour,
      time.minute,
      time.second,
    );
    return scheduledDate.isBefore(now)
        ? scheduledDate.add(Duration(hours: 1))
        : scheduledDate;
  }

  //cancelling notifications
  static void cancel(int id) => _notifications.cancel(id);
  static void cancelAll(int id) => _notifications.cancelAll();
}
