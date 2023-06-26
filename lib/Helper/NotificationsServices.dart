import 'dart:math';

import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:mytasks/Helper/Consts.dart';


class NotificationServices {
  //this function will initilize the notifications
  static Future<void> initService() async {
    await AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
          channelKey: 'firstkey',
          channelName: 'set_daily_reminder',
          channelDescription: "this chanel will have the 8:00 reminder",
          defaultColor: Consts.mainColor,
          ledColor: Consts.mainColor,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          playSound: true,
        ),
        NotificationChannel(
          channelKey: '2key',
          channelName: 'set_notification_based_on_date_and_time',
          channelDescription:
              "this chanel will use the schedual notification to creat a task",
          defaultColor: Consts.mainColor,
          ledColor: Consts.mainColor,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          playSound: true,
        ),
         NotificationChannel(
          channelKey: '3key',
          channelName: 'set_notification_based_on_date_and_time_to_end',
          channelDescription:
              "this chanel will use the schedual notification to worn the user that the time is over",
          defaultColor: Consts.mainColor,
          ledColor: Consts.mainColor,
          importance: NotificationImportance.Max,
          channelShowBadge: true,
          playSound: true,
        ),
      ],
      channelGroups: [
        NotificationChannelGroup(
          channelGroupKey: 'firstkey',
          channelGroupName: 'groupe 1',
        ),
        NotificationChannelGroup(
          channelGroupKey: '2key',
          channelGroupName: 'groupe 2',
        ),
        NotificationChannelGroup(
          channelGroupKey: '3key',
          channelGroupName: 'groupe 3',
        )
      ],
      debug: true,
    );
  }

//this function asks permission from the decice to access to the
//settings and active the notifications
  static Future askPermision() async {
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }

//this function used to set every day notification at 8:00
  static dailyNotification() async {
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 100000000,
            channelKey: "firstkey",
            title: 'set today tasks',
            body: "you need to set today's tasks to be productive"),
        schedule: NotificationCalendar(
            hour: 8, minute: 0, second: 0, millisecond: 0, repeats: true));
  }

  // this function will make the alert of the start of task
  static Future beginAlert( DateTime date,String name) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: Random().nextInt(1000000),
          channelKey: "2key",
          title: 'you have a task to do: $name ',
          body:
              "your task of: $name started you have to do it now and keep your productivity"),
      schedule: NotificationCalendar(
        year: date.year,
        month: date.month,
        day: date.day,
        hour: date.hour,
        minute: date.minute,
      ),
    );
  }

  // this function will make the alert of the end of task
  static Future endAlert( DateTime date,{required String name}) async {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: Random().nextInt(1000000),
          channelKey: "3key",
          title: 'time is up',
          body:
              "did you complete $name ?"),
      schedule: NotificationCalendar(
        year: date.year,
        month: date.month,
        day: date.day,
        hour: date.hour,
        minute: date.minute,
      ),
    );
  }
}
