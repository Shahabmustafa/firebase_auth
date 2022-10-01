// ignore_for_file: camel_case_types

import 'package:company_name/utls/utils.dart';
import 'package:company_name/view/auth/verify_number.dart';
import 'package:company_name/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class loginWithPhoneNumber extends StatefulWidget {
  const loginWithPhoneNumber({Key? key}) : super(key: key);

  @override
  State<loginWithPhoneNumber> createState() => _loginWithPhoneNumberState();
}

class _loginWithPhoneNumberState extends State<loginWithPhoneNumber> {
  bool loading = false;
  final phoneNumberController = TextEditingController();
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text('Add Your Phone'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40.0,
            ),
            TextFormField(
              controller: phoneNumberController,
              decoration: InputDecoration(
                hintText: '+12-1233456789'
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            RoundButton(
              loading: loading,
                title: 'Log In',
                onTap: (){
                setState(() {
                  loading = true;
                });
                auth.verifyPhoneNumber(
                  phoneNumber: phoneNumberController.text,
                    verificationCompleted: (_){},
                    verificationFailed: (e){
                      utls().toastMessage(e.toString());
                      setState(() {
                        loading = false;
                      });
                    },
                    codeSent: (String verificationId,int? token){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => VerifyNumber(verificationId: verificationId,)));
                    },
                    codeAutoRetrievalTimeout: (e){
                      utls().toastMessage(e.toString());
                      setState(() {
                        loading = false;
                      });
                    }
                );
                }
            ),
          ],
        ),
      ),
    );
  }
}
