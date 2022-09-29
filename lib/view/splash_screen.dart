import 'package:company_name/view/auth/splash_server.dart';
import 'package:flutter/material.dart';
import 'package:company_name/view/auth/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  SplashServer SplashScreen = SplashServer();

  void initState(){
    super.initState();
    SplashScreen.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body:  Center(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
              Text('Firebase Totorial',
              style: TextStyle(
                fontSize: 30.0
              ),),
           ],
         ),
       ),
    );
  }
}
