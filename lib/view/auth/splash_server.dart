import 'dart:async';

import 'package:company_name/post/post_screen.dart';
import 'package:company_name/view/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';


class SplashServer{
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;

    final user = auth.currentUser;

    if (user != null) {
      Timer(Duration(seconds: 3), () =>
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => PostScreen())));
    } else {
        Timer(Duration(seconds: 3), () =>
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage())));
    }
  }
}