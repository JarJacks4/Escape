import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA4bNP6FWcGwWgvx7h3qUFLNm63fE9p1-E",
            authDomain: "escape-self-care.firebaseapp.com",
            projectId: "escape-self-care",
            storageBucket: "escape-self-care.firebasestorage.app",
            messagingSenderId: "45611638400",
            appId: "1:45611638400:web:5e1b1a4340c855e3c0d065",
            measurementId: "G-JRPVFHD6YW"));
  } else {
    await Firebase.initializeApp();
  }
}
