import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD5RXwHAajysFEZHMOB2KVy9lmlyS90dIs",
            authDomain: "ubereats-234aa.firebaseapp.com",
            projectId: "ubereats-234aa",
            storageBucket: "ubereats-234aa.appspot.com",
            messagingSenderId: "555563231287",
            appId: "1:555563231287:web:555a3dd5c319eca7a977b2",
            measurementId: "G-06QMV7J6VN"));
  } else {
    await Firebase.initializeApp();
  }
}
