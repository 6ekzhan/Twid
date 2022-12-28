import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDL-7I2_46O1poS06sjaTQH_bgbn5_rFxs",
            authDomain: "twid-3e372.firebaseapp.com",
            projectId: "twid-3e372",
            storageBucket: "twid-3e372.appspot.com",
            messagingSenderId: "736682415043",
            appId: "1:736682415043:web:b5bce14933c4d6c7562376",
            measurementId: "G-GGP2N2QBC8"));
  } else {
    await Firebase.initializeApp();
  }
}
