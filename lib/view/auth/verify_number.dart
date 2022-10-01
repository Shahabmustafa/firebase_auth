import 'package:company_name/post/post_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:company_name/utls/utils.dart';
import '../../widget/button.dart';

class VerifyNumber extends StatefulWidget {
  final String verificationId;
  const VerifyNumber({Key? key, required this.verificationId}) : super(key: key);
  @override
  State<VerifyNumber> createState() => _VerifyNumberState();
}

class _VerifyNumberState extends State<VerifyNumber> {
  @override
  bool loading = false;
  final verifyCodeController = TextEditingController();
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
              controller: verifyCodeController,
              decoration: InputDecoration(
                  hintText: '6 Digit Code'
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            RoundButton(
                title: 'Login',loading: loading,onTap: ()async{
              setState(() {
                loading = true;
              });
                  final credential = PhoneAuthProvider.credential(
                      verificationId: widget.verificationId,
                      smsCode: verifyCodeController.text.toString()
                  );
                  try{
                    await auth.signInWithCredential(credential);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PostScreen()));
                  }catch(e){
                    setState(() {
                      loading = false;
                    });
                    utls().toastMessage(e.toString());
                  }
            },
            ),
          ],
        ),
      ),
    );
  }
}
