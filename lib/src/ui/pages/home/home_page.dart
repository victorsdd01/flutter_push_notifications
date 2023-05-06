
import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/src/provider/providers.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final PushNotificationProvider pushNotificationProvider =  Provider.of<PushNotificationProvider>(context);
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextButton(
            child: const Text('this is the home page, you can sen notifications here...', textAlign: TextAlign.center,), 
            onPressed: () {
              //TODO here you need to configure to send notifications from API REST
              print("");
            },
          ),
          Text(pushNotificationProvider.notificationMessage),
        ],
      ),
    );
  }
}