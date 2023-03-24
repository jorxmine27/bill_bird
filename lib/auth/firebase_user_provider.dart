import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class BillBirdFirebaseUser {
  BillBirdFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

BillBirdFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<BillBirdFirebaseUser> billBirdFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<BillBirdFirebaseUser>(
      (user) {
        currentUser = BillBirdFirebaseUser(user);
        return currentUser!;
      },
    );
