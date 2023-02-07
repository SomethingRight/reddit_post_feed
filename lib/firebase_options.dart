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
    apiKey: 'AIzaSyC3gUWN9zxy8Q_253TbBuJqbqq5063Q01E',
    appId: '1:930203121601:web:771bf6d37af45c40e32140',
    messagingSenderId: '930203121601',
    projectId: 'reddit-feed-ac59a',
    authDomain: 'reddit-feed-ac59a.firebaseapp.com',
    storageBucket: 'reddit-feed-ac59a.appspot.com',
    measurementId: 'G-ZMJYYBQDGS',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlcjo6ZspDDkGPm9cGXl3_SuuBtKdM9g0',
    appId: '1:930203121601:android:0cccc738cbf3453be32140',
    messagingSenderId: '930203121601',
    projectId: 'reddit-feed-ac59a',
    storageBucket: 'reddit-feed-ac59a.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9bMSz6fsNZQ0XqLmsliL4gDo_EGf9wqQ',
    appId: '1:930203121601:ios:57eabaf2b77b6c4ee32140',
    messagingSenderId: '930203121601',
    projectId: 'reddit-feed-ac59a',
    storageBucket: 'reddit-feed-ac59a.appspot.com',
    iosClientId: '930203121601-juqrp2098vroerdhdf3b3o055mdiden3.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTestAppRedditGetPosts',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9bMSz6fsNZQ0XqLmsliL4gDo_EGf9wqQ',
    appId: '1:930203121601:ios:57eabaf2b77b6c4ee32140',
    messagingSenderId: '930203121601',
    projectId: 'reddit-feed-ac59a',
    storageBucket: 'reddit-feed-ac59a.appspot.com',
    iosClientId: '930203121601-juqrp2098vroerdhdf3b3o055mdiden3.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterTestAppRedditGetPosts',
  );
}
