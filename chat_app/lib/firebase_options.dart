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
    apiKey: 'AIzaSyAtY_6_pzIFWPHbVuvOlb_-6HCXO3d1RjY',
    appId: '1:663758447084:web:999088f8f0944993e9e0c9',
    messagingSenderId: '663758447084',
    projectId: 'chatapp-b14e5',
    authDomain: 'chatapp-b14e5.firebaseapp.com',
    storageBucket: 'chatapp-b14e5.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCdLjHhBD9fk2rNjpylXW5j3MHaPbDxmOY',
    appId: '1:663758447084:android:08e799bfd488e2c6e9e0c9',
    messagingSenderId: '663758447084',
    projectId: 'chatapp-b14e5',
    storageBucket: 'chatapp-b14e5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRTTbqbQKAPPid8_4SnjJ8uF58_K-lbFc',
    appId: '1:663758447084:ios:572fd248b84354ede9e0c9',
    messagingSenderId: '663758447084',
    projectId: 'chatapp-b14e5',
    storageBucket: 'chatapp-b14e5.appspot.com',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRTTbqbQKAPPid8_4SnjJ8uF58_K-lbFc',
    appId: '1:663758447084:ios:3df5f74d303b5653e9e0c9',
    messagingSenderId: '663758447084',
    projectId: 'chatapp-b14e5',
    storageBucket: 'chatapp-b14e5.appspot.com',
    iosBundleId: 'com.example.chatApp.RunnerTests',
  );
}
