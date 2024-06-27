import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyD4O8CQVfy3OV9FVmPWJvdXMC73jeEF_xo",
            authDomain: "midwifementor-a515e.firebaseapp.com",
            projectId: "midwifementor-a515e",
            storageBucket: "midwifementor-a515e.appspot.com",
            messagingSenderId: "7775155401",
            appId: "1:7775155401:web:ca05ea4388e5fdcbcfc918"));
  } else {
    await Firebase.initializeApp();
  }
}
