import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:reklam/login/login.dart';
import 'package:reklam/main.dart';

import '../pages/home_screen.dart';

class Authenticate extends StatelessWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    if (_auth.currentUser != null) {
      return introduction();
    } else {
      return LoginScreen();
    }
  }
}