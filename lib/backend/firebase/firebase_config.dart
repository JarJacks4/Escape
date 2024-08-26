import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyATwDmskpfRBXXKcUnMjTnzXHT6Zq27_b4",
            authDomain: "escape-ujuzxr.firebaseapp.com",
            projectId: "escape-ujuzxr",
            storageBucket: "escape-ujuzxr.appspot.com",
            messagingSenderId: "334104837337",
            appId: "1:334104837337:web:541da4d8aca30bafb852c8",
            measurementId: "G-NQQPH5SD7Z"));
  } else {
    await Firebase.initializeApp();
  }
}
