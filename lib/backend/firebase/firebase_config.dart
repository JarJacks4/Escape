import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyA7-1YsAfEcsHbJXFtGUd0M0C6C3HM59oc",
            authDomain: "escape-self-care-505618.firebaseapp.com",
            projectId: "escape-self-care-505618",
            storageBucket: "escape-self-care-505618.firebasestorage.app",
            messagingSenderId: "861854898360",
            appId: "1:861854898360:web:d311ebd8f2b322835ffc4d",
            measurementId: "G-B3182WX8XR"));
  } else {
    await Firebase.initializeApp();
  }
}
