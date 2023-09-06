import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyB7shfTJSgrpROITyKSYtKESwNx43XSxrM",
            authDomain: "grocery-c2867.firebaseapp.com",
            projectId: "grocery-c2867",
            storageBucket: "grocery-c2867.appspot.com",
            messagingSenderId: "4445619835",
            appId: "1:4445619835:web:a323856a2a26d12f4484de",
            measurementId: "G-2JHZKPDF39"));
  } else {
    await Firebase.initializeApp();
  }
}
