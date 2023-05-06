import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  String message= "wait...";
  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then((value) {
      if(value != null){
        print(value.data);
        setState(() => message = '${value.notification!.title!} ${value.notification!.body} Im coming for terminated state' );
      }
    });
    FirebaseMessaging.onMessage.listen((event) {
      print(event.data);
      setState(() => message = '${event.notification!.title!} Im coming for foreground state');
    });

    FirebaseMessaging.onMessageOpenedApp.listen((event) { 
      print(event.data);
      setState(() => message = '${event.notification!.title!} ${event.notification!.body} Im coming for background state' );
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center( 
        child: Text(message),
      ),
    );
  }
}