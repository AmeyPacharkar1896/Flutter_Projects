// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return windows;
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
    apiKey: 'AIzaSyAa7b5a6_0ylqln4onoGTL6rkc_1kEVTm4',
    appId: '1:171382287755:web:48dc921809d009222bd38e',
    messagingSenderId: '171382287755',
    projectId: 'fir-authentification-cb438',
    authDomain: 'fir-authentification-cb438.firebaseapp.com',
    storageBucket: 'fir-authentification-cb438.appspot.com',
    measurementId: 'G-EJTQ6H86VW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAd6N_aZoP7UJbwQto3OhHlxD_kr_GZ8yU',
    appId: '1:171382287755:android:311cc48cfa48d36e2bd38e',
    messagingSenderId: '171382287755',
    projectId: 'fir-authentification-cb438',
    storageBucket: 'fir-authentification-cb438.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbtbIboIRPT9Aql48cYwnErB8jhxAYve0',
    appId: '1:171382287755:ios:56dd278ae101cbc52bd38e',
    messagingSenderId: '171382287755',
    projectId: 'fir-authentification-cb438',
    storageBucket: 'fir-authentification-cb438.appspot.com',
    iosBundleId: 'com.example.firebaseAuthentication',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbtbIboIRPT9Aql48cYwnErB8jhxAYve0',
    appId: '1:171382287755:ios:56dd278ae101cbc52bd38e',
    messagingSenderId: '171382287755',
    projectId: 'fir-authentification-cb438',
    storageBucket: 'fir-authentification-cb438.appspot.com',
    iosBundleId: 'com.example.firebaseAuthentication',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAa7b5a6_0ylqln4onoGTL6rkc_1kEVTm4',
    appId: '1:171382287755:web:c2a0d1adf2c2f6332bd38e',
    messagingSenderId: '171382287755',
    projectId: 'fir-authentification-cb438',
    authDomain: 'fir-authentification-cb438.firebaseapp.com',
    storageBucket: 'fir-authentification-cb438.appspot.com',
    measurementId: 'G-DH1W459B72',
  );

}