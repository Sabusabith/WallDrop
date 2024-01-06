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
    apiKey: 'AIzaSyDnZOOll6T3IAMRCvXSqtiNdU1RuYHdV4Y',
    appId: '1:86144518123:web:9feb6b90ce021a84517bae',
    messagingSenderId: '86144518123',
    projectId: 'walldrop-47668',
    authDomain: 'walldrop-47668.firebaseapp.com',
    storageBucket: 'walldrop-47668.appspot.com',
    measurementId: 'G-Q1FFC7PZBR',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB15Sej4er-qX5YZlaIxyj4f35ZzCk1M_g',
    appId: '1:86144518123:android:cb989df84a16e067517bae',
    messagingSenderId: '86144518123',
    projectId: 'walldrop-47668',
    storageBucket: 'walldrop-47668.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDXiAEr-eI2jqWI176d71rpmQOshtVEzLs',
    appId: '1:86144518123:ios:f621e93e6cf52d8e517bae',
    messagingSenderId: '86144518123',
    projectId: 'walldrop-47668',
    storageBucket: 'walldrop-47668.appspot.com',
    iosBundleId: 'com.example.walldrops',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDXiAEr-eI2jqWI176d71rpmQOshtVEzLs',
    appId: '1:86144518123:ios:ae367ba28c9b95df517bae',
    messagingSenderId: '86144518123',
    projectId: 'walldrop-47668',
    storageBucket: 'walldrop-47668.appspot.com',
    iosBundleId: 'com.example.walldrop.RunnerTests',
  );
}
