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
    apiKey: 'AIzaSyC4yvowiUpyRu_DSAthw9pDnJibuXVsbzM',
    appId: '1:974477026339:web:b9729f24696e2e8e2dbd96',
    messagingSenderId: '974477026339',
    projectId: 'absentee-a1e77',
    authDomain: 'absentee-a1e77.firebaseapp.com',
    storageBucket: 'absentee-a1e77.appspot.com',
    measurementId: 'G-E6S0B5DR3J',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCM-ZizCsa3KHsEtIg5YKBgmfbzHjBmPkw',
    appId: '1:974477026339:android:4c22662bf6e307192dbd96',
    messagingSenderId: '974477026339',
    projectId: 'absentee-a1e77',
    storageBucket: 'absentee-a1e77.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBJTUi3eFwONa8YJVTnHNJHZUp635FqXzw',
    appId: '1:974477026339:ios:8392aacb78fb121a2dbd96',
    messagingSenderId: '974477026339',
    projectId: 'absentee-a1e77',
    storageBucket: 'absentee-a1e77.appspot.com',
    iosClientId: '974477026339-bf37l70g1n0etu72i3906r442h4ki0dp.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBJTUi3eFwONa8YJVTnHNJHZUp635FqXzw',
    appId: '1:974477026339:ios:8392aacb78fb121a2dbd96',
    messagingSenderId: '974477026339',
    projectId: 'absentee-a1e77',
    storageBucket: 'absentee-a1e77.appspot.com',
    iosClientId: '974477026339-bf37l70g1n0etu72i3906r442h4ki0dp.apps.googleusercontent.com',
    iosBundleId: 'com.example.demo',
  );
}
