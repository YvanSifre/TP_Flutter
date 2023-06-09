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
    apiKey: 'AIzaSyDjBMoAPeTv9u-IOwIY_qSJZqX7aI4ZOvo',
    appId: '1:863908303563:web:e34602511c0327266f414e',
    messagingSenderId: '863908303563',
    projectId: 'tp-flutter-68d4e',
    authDomain: 'tp-flutter-68d4e.firebaseapp.com',
    storageBucket: 'tp-flutter-68d4e.appspot.com',
    measurementId: 'G-9FWY9J3S07',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCn0Wq0YwglhuN3QLeb58HoOoie3bWtkU4',
    appId: '1:863908303563:android:a4e94b56961f35396f414e',
    messagingSenderId: '863908303563',
    projectId: 'tp-flutter-68d4e',
    storageBucket: 'tp-flutter-68d4e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCR6H5nwlSmcqcWK3HkOsMuEIdjYtuQAj0',
    appId: '1:863908303563:ios:2645365d7502fa2e6f414e',
    messagingSenderId: '863908303563',
    projectId: 'tp-flutter-68d4e',
    storageBucket: 'tp-flutter-68d4e.appspot.com',
    iosBundleId: 'com.example.tp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCR6H5nwlSmcqcWK3HkOsMuEIdjYtuQAj0',
    appId: '1:863908303563:ios:2645365d7502fa2e6f414e',
    messagingSenderId: '863908303563',
    projectId: 'tp-flutter-68d4e',
    storageBucket: 'tp-flutter-68d4e.appspot.com',
    iosBundleId: 'com.example.tp',
  );
}
