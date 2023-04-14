import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notifications/firebase_options.dart';
import 'package:flutter_push_notifications/src/ui/pages/pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home'         : (_) => const HomePage(),
        'message_page' : (_) => const MessagePage(),
      },
      onUnknownRoute: (settings) {
        if (kDebugMode) {
          print("unknownRoute");
        }
        return null;
      },
    );
  }
}