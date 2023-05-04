
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quotes/features/local_notification/data/models/notification_model.dart';
import 'package:quotes/features/random_quotes/domain/entities/quote.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class NotificationManager
{
  Future<void> initNotifications();
  Future<void> enableNotifications(bool enable, int key,Quote quote);
  bool isNotificationsEnabled();
}

class LocalNotification implements NotificationManager
{

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin ;
  final AndroidInitializationSettings initializationSettingsAndroid ;
  final DarwinInitializationSettings initializationSettingsDarwin ;
  final InitializationSettings initializationSettings ;
  final AndroidNotificationDetails androidNotificationDetails ;
  final NotificationDetails notificationDetails ;
  AppNotificationModel appNotificationModel ;
  final SharedPreferences sharedPreferences;

  LocalNotification( {
    required this.flutterLocalNotificationsPlugin,
    required this.initializationSettingsAndroid,
    required this.initializationSettingsDarwin,
    required this.initializationSettings,
    required this.androidNotificationDetails,
    required this.notificationDetails,
    required this.appNotificationModel,
    required this.sharedPreferences,
});


  @override
  Future<void> initNotifications() async
  {
    await flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse,
    );
  }

  void onDidReceiveNotificationResponse(NotificationResponse notificationResponse)
  {
    /// TODO action when notification triggered
    /*final String ? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
     Navigator.push(
      context,
      MaterialPageRoute<void>(builder: (context) => Container()),
    );*/
  }


  sendNotifications(int key,Quote quote) async {
    appNotificationModel = AppNotificationModel.fromQuote(quote);
    await flutterLocalNotificationsPlugin.show(
        key, 'plain title', 'plain body', notificationDetails,);
    // await flutterLocalNotificationsPlugin.periodicallyShow(key, appNotificationModel.title,
    //     appNotificationModel.body, RepeatInterval.everyMinute, notificationDetails,
    //     androidAllowWhileIdle: true);
  }

  @override
  Future<void> enableNotifications(bool enable, int key, Quote quote) async {
    sharedPreferences.setBool("isNotificationEnabled", enable);
    if(enable)
      {
       await sendNotifications(key,quote);
      }
  }

  @override
  bool isNotificationsEnabled() {
    return sharedPreferences.getBool('isNotificationEnabled') ?? false;
  }



}