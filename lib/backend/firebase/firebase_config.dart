import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDoQHTA2rOLhnHw9EiE7I0ELUCWSRWa9y4",
            authDomain: "golfy-y1vc9h.firebaseapp.com",
            projectId: "golfy-y1vc9h",
            storageBucket: "golfy-y1vc9h.appspot.com",
            messagingSenderId: "902390253877",
            appId: "1:902390253877:web:244910fdad68ea3441647c"));
  } else {
    await Firebase.initializeApp();
  }
}
