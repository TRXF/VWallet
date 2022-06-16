import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class VWalletFirebaseUser {
  VWalletFirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

VWalletFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<VWalletFirebaseUser> vWalletFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<VWalletFirebaseUser>(
        (user) => currentUser = VWalletFirebaseUser(user));
