import 'package:company_name/view/auth/login_page.dart';
import 'package:company_name/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('SIGN IN')),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Form(
              key: _formKey,
                child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        hintText: "Enter your Email",
                        prefixIcon: Icon(Icons.alternate_email)
                    ),
                    controller: emailController,
                    validator: (email){
                      if(email!.isEmpty){
                        return "Enter your Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Enter your Password",
                        prefixIcon: Icon(Icons.lock)
                    ),
                    controller: passwordController,
                    validator: (password){
                      if(password!.isEmpty){
                        return "Enter your Password";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  RoundButton(title: 'Sign Up',
                      onTap: (){
                    if(_formKey.currentState!.validate()){
                      _auth.createUserWithEmailAndPassword(
                          email: emailController.text,
                          password: passwordController.text,
                      );
                    }
                  }),
                  SizedBox(
                    height: 15.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an accout?'),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) =>LoginPage()));
                      }, child: Text('Log In'))
                    ],
                  ),
                ],
            )
            ),
          ],
        ),
      ),
    );
  }
}
