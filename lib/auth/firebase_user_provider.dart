import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TwidFirebaseUser {
  TwidFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

TwidFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TwidFirebaseUser> twidFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TwidFirebaseUser>(
      (user) {
        currentUser = TwidFirebaseUser(user);
        return currentUser!;
      },
    );
