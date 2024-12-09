import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class UserState with ChangeNotifier {
  User? _user;
  User? get user => _user;
  bool get isAuthenticated => _user != null;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    setUser(null);
  }
}

Future<void> login(BuildContext context) async {
  try {
    // Use cascading operator and null check optimization
    final googleAccount =
        await GoogleSignIn().signIn().timeout(const Duration(seconds: 30));
    if (googleAccount == null) {
      throw Exception('Google Sign In failed');
    }

    // Parallel execution of authentication
    final authFuture = googleAccount.authentication;

    // Wait for authentication
    final googleAuth = await authFuture;

    // Use null-safe operator and create credential only once
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);
    final user = userCredential.user;

    if (user == null) {
      throw Exception('Firebase authentication failed');
    }

    // Use read instead of Provider.of for single access
    context.read<UserState>().setUser(user);
  } on TimeoutException {
    // Handle timeout exception
    throw Exception('Google Sign In timed out');
  } catch (e) {
    // Add error handling
    throw Exception('Login failed: $e');
  }
}
