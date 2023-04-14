// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAiozIdylcTUMDB1-dWXvGXupSVECO-Wgg',
    appId: '1:103024898015:web:1abb8870932ec75117de6a',
    messagingSenderId: '103024898015',
    projectId: 'flutter-push-notificatio-b3aa2',
    authDomain: 'flutter-push-notificatio-b3aa2.firebaseapp.com',
    storageBucket: 'flutter-push-notificatio-b3aa2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDTyIzVhi9Jf5AWX4wTXCMB3H_H6ZqkHDA',
    appId: '1:103024898015:android:b9450cd5ca11b00417de6a',
    messagingSenderId: '103024898015',
    projectId: 'flutter-push-notificatio-b3aa2',
    storageBucket: 'flutter-push-notificatio-b3aa2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQk-b-_oVAHdw2PvrxaL1mVK2aI38wy8A',
    appId: '1:103024898015:ios:76c1d945e5838c8a17de6a',
    messagingSenderId: '103024898015',
    projectId: 'flutter-push-notificatio-b3aa2',
    storageBucket: 'flutter-push-notificatio-b3aa2.appspot.com',
    iosClientId: '103024898015-n2ke77hvj631l0i6uklp86tkgfoe82ep.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPushNotifications',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBQk-b-_oVAHdw2PvrxaL1mVK2aI38wy8A',
    appId: '1:103024898015:ios:76c1d945e5838c8a17de6a',
    messagingSenderId: '103024898015',
    projectId: 'flutter-push-notificatio-b3aa2',
    storageBucket: 'flutter-push-notificatio-b3aa2.appspot.com',
    iosClientId: '103024898015-n2ke77hvj631l0i6uklp86tkgfoe82ep.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterPushNotifications',
  );
}