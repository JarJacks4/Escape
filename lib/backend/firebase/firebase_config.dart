import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDQKdlDKLT4zNgsPGQ5JczzGUT1Uf3BAFI",
            authDomain: "escape-self-care-ai.firebaseapp.com",
            projectId: "escape-self-care-ai",
            storageBucket: "escape-self-care-ai.firebasestorage.app",
            messagingSenderId: "286076426888",
            appId: "1:286076426888:web:9bfce43930080aaa221d3d",
            measurementId: "G-NKQQZMG158"));
  } else {
    await Firebase.initializeApp();
  }
}
