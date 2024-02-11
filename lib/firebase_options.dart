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
    apiKey: 'AIzaSyDkFL63M87q0aulNgmNvDDiG8ZcLo1Lq_c',
    appId: '1:517603694752:web:096ac57693416bebfad1c5',
    messagingSenderId: '517603694752',
    projectId: 'greenplate-4d87e',
    authDomain: 'greenplate-4d87e.firebaseapp.com',
    storageBucket: 'greenplate-4d87e.appspot.com',
    measurementId: 'G-GZHNYGNBKW',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBh-ATtd-Z-942MEoeSZ4tDfRCnhOxjQJQ',
    appId: '1:517603694752:android:e84da6c860a6129cfad1c5',
    messagingSenderId: '517603694752',
    projectId: 'greenplate-4d87e',
    storageBucket: 'greenplate-4d87e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyABQiFk5PZ6i8zotId1bgHce2Rmqckiw18',
    appId: '1:517603694752:ios:21252a093a9fd2fbfad1c5',
    messagingSenderId: '517603694752',
    projectId: 'greenplate-4d87e',
    storageBucket: 'greenplate-4d87e.appspot.com',
    iosBundleId: 'com.example.foodOrderingMobileApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyABQiFk5PZ6i8zotId1bgHce2Rmqckiw18',
    appId: '1:517603694752:ios:2f6a07f7781bde47fad1c5',
    messagingSenderId: '517603694752',
    projectId: 'greenplate-4d87e',
    storageBucket: 'greenplate-4d87e.appspot.com',
    iosBundleId: 'com.example.foodOrderingMobileApp.RunnerTests',
  );
}
