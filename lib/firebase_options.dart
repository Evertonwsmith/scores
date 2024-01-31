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
    apiKey: 'AIzaSyBzJj-8RyGwf3YBBli6QH0kmajDQ4_3w2E',
    appId: '1:562798342506:web:b64886fb000299b7a3b513',
    messagingSenderId: '562798342506',
    projectId: 'scores2024',
    authDomain: 'scores2024.firebaseapp.com',
    storageBucket: 'scores2024.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCyuQ21CGTpDZ58ArVY4Da7QT9MA_bZwZA',
    appId: '1:562798342506:android:5dde130b788d65a9a3b513',
    messagingSenderId: '562798342506',
    projectId: 'scores2024',
    storageBucket: 'scores2024.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNpgQCEKoRknSWR1IcpYCulzHQe2dgBFM',
    appId: '1:562798342506:ios:d209340cedcfda2ea3b513',
    messagingSenderId: '562798342506',
    projectId: 'scores2024',
    storageBucket: 'scores2024.appspot.com',
    iosBundleId: 'com.example.scores',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNpgQCEKoRknSWR1IcpYCulzHQe2dgBFM',
    appId: '1:562798342506:ios:eff36fa68b52facaa3b513',
    messagingSenderId: '562798342506',
    projectId: 'scores2024',
    storageBucket: 'scores2024.appspot.com',
    iosBundleId: 'com.example.scores.RunnerTests',
  );
}