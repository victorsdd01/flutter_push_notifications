
import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class PushNotificationProvider extends ChangeNotifier{

  String notificationMessage = "";
  static String? token;
  final GlobalKey<NavigatorState> navigatorKey =  GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerState = GlobalKey<ScaffoldMessengerState>();

  Future<void> initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    // await requestPermission();

    token = await FirebaseMessaging.instance.getToken();

    // Handlers
    FirebaseMessaging.onMessage.listen((event) {
      notificationMessage =  event.notification!.title!;
      notifyListeners();
      scaffoldMessengerState.currentState?.showSnackBar(
        SnackBar(
            content: Text(notificationMessage)
          )
        );
    });
    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      notificationMessage =  event.notification!.title!;
      notifyListeners();
      navigatorKey.currentState?.pushNamed("message_page", arguments: notificationMessage);
    },);
    FirebaseMessaging.instance.getInitialMessage().then((value){
      if(value != null){
        print("🍁initialMessage: ${value.data}");
        notificationMessage =  value.notification!.title!;
        notifyListeners();
        navigatorKey.currentState?.pushNamed("message_page", arguments: notificationMessage);
      }
    });
  }
}