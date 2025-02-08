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
    apiKey: 'AIzaSyDVRxJEC73ASn_6OYej4L-05ErzhVorCXI',
    appId: '1:633239053108:web:dadfe310bb1a4ff67cfb61',
    messagingSenderId: '633239053108',
    projectId: 'restaurante-8fe1b',
    authDomain: 'restaurante-8fe1b.firebaseapp.com',
    storageBucket: 'restaurante-8fe1b.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCrk8hgmFzXPhewq5e3C-8lsgwD_yx5EoQ',
    appId: '1:633239053108:android:7a31544383af75307cfb61',
    messagingSenderId: '633239053108',
    projectId: 'restaurante-8fe1b',
    storageBucket: 'restaurante-8fe1b.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAgiBGa0LNab33lvjpiBjlKHZUBcjmOLhU',
    appId: '1:633239053108:ios:d4fb84a33d1656797cfb61',
    messagingSenderId: '633239053108',
    projectId: 'restaurante-8fe1b',
    storageBucket: 'restaurante-8fe1b.firebasestorage.app',
    iosClientId: '633239053108-26s35vvj2lklcenc2rg6tadjfsv1e0j4.apps.googleusercontent.com',
    iosBundleId: 'com.example.restauranteApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDVRxJEC73ASn_6OYej4L-05ErzhVorCXI',
    appId: '1:633239053108:web:d581dd762d8cf0de7cfb61',
    messagingSenderId: '633239053108',
    projectId: 'restaurante-8fe1b',
    authDomain: 'restaurante-8fe1b.firebaseapp.com',
    storageBucket: 'restaurante-8fe1b.firebasestorage.app',
  );
}
