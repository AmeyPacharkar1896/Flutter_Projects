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
    apiKey: 'AIzaSyAa_pXpacJdBXCHh_hfw8Ex6TWZAmF02yA',
    appId: '1:1026434676134:web:ce435a14ef32f44eb24b67',
    messagingSenderId: '1026434676134',
    projectId: 'jkb-firebase-chat',
    authDomain: 'jkb-firebase-chat.firebaseapp.com',
    storageBucket: 'jkb-firebase-chat.appspot.com',
    measurementId: 'G-4MT6JCRWPD',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCkv4xXKi0uT1DInlboPrMGwtiW86Bdh4w',
    appId: '1:1026434676134:android:46a864cf2c55e84fb24b67',
    messagingSenderId: '1026434676134',
    projectId: 'jkb-firebase-chat',
    storageBucket: 'jkb-firebase-chat.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCpm_Cy39ALq_zEW470luM6nwIr2QpUyKw',
    appId: '1:1026434676134:ios:b3369b4b18c17210b24b67',
    messagingSenderId: '1026434676134',
    projectId: 'jkb-firebase-chat',
    storageBucket: 'jkb-firebase-chat.appspot.com',
    iosBundleId: 'com.amey.jkbFirebaseChat',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCpm_Cy39ALq_zEW470luM6nwIr2QpUyKw',
    appId: '1:1026434676134:ios:b3369b4b18c17210b24b67',
    messagingSenderId: '1026434676134',
    projectId: 'jkb-firebase-chat',
    storageBucket: 'jkb-firebase-chat.appspot.com',
    iosBundleId: 'com.amey.jkbFirebaseChat',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAa_pXpacJdBXCHh_hfw8Ex6TWZAmF02yA',
    appId: '1:1026434676134:web:00263441125c1759b24b67',
    messagingSenderId: '1026434676134',
    projectId: 'jkb-firebase-chat',
    authDomain: 'jkb-firebase-chat.firebaseapp.com',
    storageBucket: 'jkb-firebase-chat.appspot.com',
    measurementId: 'G-5Q1T3DEW7S',
  );

}