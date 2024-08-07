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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA0Z4xdbXI1JFUIxyoyTVeswt0GCK9CHDs',
    appId: '1:498150581082:web:855c1b2d675273acee4963',
    messagingSenderId: '498150581082',
    projectId: 'flutterstore-d12b6',
    authDomain: 'flutterstore-d12b6.firebaseapp.com',
    storageBucket: 'flutterstore-d12b6.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDUpA-5M85vxDLnxIBWyM1_Wb0erqei9ZI',
    appId: '1:498150581082:android:e4ae1eebe3016bb0ee4963',
    messagingSenderId: '498150581082',
    projectId: 'flutterstore-d12b6',
    storageBucket: 'flutterstore-d12b6.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCOZs_qIXhpB382POo6PjeaFBWFLiaiH9k',
    appId: '1:498150581082:ios:689ecb26d59376f2ee4963',
    messagingSenderId: '498150581082',
    projectId: 'flutterstore-d12b6',
    storageBucket: 'flutterstore-d12b6.appspot.com',
    androidClientId: '498150581082-46pabm24p8dqqnf1miqq7sad0hs6kak8.apps.googleusercontent.com',
    iosClientId: '498150581082-seg9ng4lccvp0aa6nmkfrvp17nik9t9t.apps.googleusercontent.com',
    iosBundleId: 'com.tramtbh.flutterStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA0Z4xdbXI1JFUIxyoyTVeswt0GCK9CHDs',
    appId: '1:498150581082:web:92bb76de281bd22aee4963',
    messagingSenderId: '498150581082',
    projectId: 'flutterstore-d12b6',
    authDomain: 'flutterstore-d12b6.firebaseapp.com',
    storageBucket: 'flutterstore-d12b6.appspot.com',
  );

}