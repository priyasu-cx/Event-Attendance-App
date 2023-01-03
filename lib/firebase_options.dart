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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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

  static const FirebaseOptions web = const FirebaseOptions(
    apiKey: 'AIzaSyAV-oQ-GA9hQ5g1gnkyiqQnDEbvKyAVgLQ',
    appId: '1:123593236682:web:365b34b6f9d53cbbdb9433',
    messagingSenderId: '123593236682',
    projectId: 'devfestkol2022',
    authDomain: 'devfestkol2022.firebaseapp.com',
    storageBucket: 'devfestkol2022.appspot.com',
    measurementId: 'G-1J18RDK7LR',
  );

  static const FirebaseOptions android = const FirebaseOptions(
    apiKey: 'AIzaSyA4jPQXL6vLw89ooRBOIEbonThDZS3mm94',
    appId: '1:123593236682:android:3f1ad15e458b8bf8db9433',
    messagingSenderId: '123593236682',
    projectId: 'devfestkol2022',
    storageBucket: 'devfestkol2022.appspot.com',
  );

  static const FirebaseOptions ios = const FirebaseOptions(
    apiKey: 'AIzaSyCPUOP_Zrhg7_cTtlUu1LddKQsMcKRmgVw',
    appId: '1:123593236682:ios:8fde85d22bfa2ec2db9433',
    messagingSenderId: '123593236682',
    projectId: 'devfestkol2022',
    storageBucket: 'devfestkol2022.appspot.com',
    iosClientId: '123593236682-9emrfdbpdpire2sudntjtmecfcei41kt.apps.googleusercontent.com',
    iosBundleId: 'com.gdgkolkata.gdgkolkata',
  );
}