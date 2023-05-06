import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotifications  {

  static final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  static void initilize () {

    InitializationSettings initializationSettings =  const InitializationSettings(
      android: AndroidInitializationSettings("@minmap/ic_launcher")
    );
    _flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (details) {
        print("details: $details");
      },
    );

  }

  static void showNotificationOnForeground(RemoteMessage remoteMessage){
    NotificationDetails notificationDetails =  const NotificationDetails(
      android: AndroidNotificationDetails("channelId", "channelName")
    );
    _flutterLocalNotificationsPlugin.show(
      int.parse(remoteMessage.messageId!), 
      remoteMessage.notification!.title, 
      remoteMessage.notification!.body,
      notificationDetails
    );
  }
}