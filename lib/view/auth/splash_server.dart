import 'dart:async';

import 'package:company_name/view/auth/login_page.dart';
import 'package:flutter/material.dart';

class SplashServer{
  void isLogin(BuildContext context){
    Timer(Duration(seconds: 3),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage())));
  }
}