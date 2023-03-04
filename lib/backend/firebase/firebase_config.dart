import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyCfS7q3fVwSU-8tW5UHutbRTTZroaOhkps",
            authDomain: "lettutor-54662.firebaseapp.com",
            projectId: "lettutor-54662",
            storageBucket: "lettutor-54662.appspot.com",
            messagingSenderId: "1027189040348",
            appId: "1:1027189040348:web:1205cfff5707b5bc6b0019",
            measurementId: "G-4H65J05SH9"));
  } else {
    await Firebase.initializeApp();
  }
}
