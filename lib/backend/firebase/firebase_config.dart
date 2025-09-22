import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBN9NZ8WPzy-v0HNFAyMuIT_J8foTgNwPI",
            authDomain: "sweet-reactions.firebaseapp.com",
            projectId: "sweet-reactions",
            storageBucket: "sweet-reactions.firebasestorage.app",
            messagingSenderId: "366670170510",
            appId: "1:366670170510:web:085c7a793a567e2cc63cdf"));
  } else {
    await Firebase.initializeApp();
  }
}
