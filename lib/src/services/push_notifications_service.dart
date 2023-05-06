
import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';


class PushNotificationService {

  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  static String? token;
  static String notificationMessage = "";
  static final StreamController<String> _messageStreamController = StreamController<String>.broadcast();
  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future<NotificationSettings?> requestPermission() async {
    try{
      NotificationSettings settings = await firebaseMessaging.requestPermission(
         alert: true,
         announcement: false,
         badge: true,
         carPlay: false,
         criticalAlert: false,
         provisional: false,
         sound: true,
      );
      return settings;
    } on Exception catch(e) {
      if (kDebugMode) {
        print("something wrong request permission ❌ $e");
      }
      return null;
    }
  }

  
  static Future initializeApp() async {

    // Push Notifications
    await Firebase.initializeApp();
    // await requestPermission();

    token = await FirebaseMessaging.instance.getToken();
    print('Token: $token');

    // Handlers
    FirebaseMessaging.onMessage.listen((event) {
      notificationMessage =  event.notification!.title!;
      print("🧲message:$notificationMessage");
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      notificationMessage =  event.notification!.title!;
      print("🧲message:$notificationMessage");
    },);
    FirebaseMessaging.instance.getInitialMessage().then((value){
      if(value != null){
        print("🍁initialMessage: ${value.data}");
        notificationMessage =  value.notification!.title!;
        print("🧲message:$notificationMessage");
      }
    });
  }

  closeStream(){
    _messageStreamController.close();
  }





}