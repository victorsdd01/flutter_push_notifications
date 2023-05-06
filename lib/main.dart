import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/src/provider/providers.dart';
import 'package:flutter_push_notifications/src/ui/pages/pages.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => PushNotificationProvider() ),
      ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  
    final PushNotificationProvider pushNotificationProvider =  Provider.of<PushNotificationProvider>(context);
    return  FutureBuilder(
      future: pushNotificationProvider.initializeApp(),
      builder: (_, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: pushNotificationProvider.navigatorKey,
          scaffoldMessengerKey: pushNotificationProvider.scaffoldMessengerState,
          initialRoute: 'home',
          routes: {
            'home'         : (_) => const HomePage(),
            'message_page' : (_) => const MessagePage(),
            'test'         : (_) => const TestPage()
          },
          onUnknownRoute: (settings) {
            if (kDebugMode) {
              print("unknownRoute");
            }
            return null;
          },
        );
      },
    );
  }
}