import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAK3m6SGOydcuqCLhT0oVVQSZ3xwdVHBSg",
            authDomain: "billbird-f5eeb.firebaseapp.com",
            projectId: "billbird-f5eeb",
            storageBucket: "billbird-f5eeb.appspot.com",
            messagingSenderId: "986101236611",
            appId: "1:986101236611:web:c0e14016f03a70c1086cb6",
            measurementId: "G-PK1MB9XD68"));
  } else {
    await Firebase.initializeApp();
  }
}
