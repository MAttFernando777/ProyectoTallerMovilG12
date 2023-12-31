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
    apiKey: 'AIzaSyBh_E_5UjxbgmT2z4g3v-RFi1rSCbaRjhE',
    appId: '1:110049920528:web:79f10014a1ae4bb5f9ec95',
    messagingSenderId: '110049920528',
    projectId: 'proyectotallermovilg12',
    authDomain: 'proyectotallermovilg12.firebaseapp.com',
    storageBucket: 'proyectotallermovilg12.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBqUN0XW_oRNgT1eUcpMbI6EPFKtA1X_I8',
    appId: '1:110049920528:android:f70d0be79a03393ef9ec95',
    messagingSenderId: '110049920528',
    projectId: 'proyectotallermovilg12',
    storageBucket: 'proyectotallermovilg12.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeyNu9Gj4NIYiugLoMzwZ5j_I2XppZ5Ks',
    appId: '1:110049920528:ios:022f9cbdb0928262f9ec95',
    messagingSenderId: '110049920528',
    projectId: 'proyectotallermovilg12',
    storageBucket: 'proyectotallermovilg12.appspot.com',
    iosBundleId: 'com.example.proyectoG12',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAeyNu9Gj4NIYiugLoMzwZ5j_I2XppZ5Ks',
    appId: '1:110049920528:ios:279ba22097816541f9ec95',
    messagingSenderId: '110049920528',
    projectId: 'proyectotallermovilg12',
    storageBucket: 'proyectotallermovilg12.appspot.com',
    iosBundleId: 'com.example.proyectoG12.RunnerTests',
  );
}
