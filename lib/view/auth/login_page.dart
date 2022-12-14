import 'package:company_name/post/post_screen.dart';
import 'package:company_name/utls/utils.dart';
import 'package:company_name/view/auth/login_with_phone_number.dart';
import 'package:company_name/widget/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:company_name/view/auth/sign_up.dart';
import 'package:flutter/services.dart';
import 'package:company_name/utls/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  bool loading= false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void Login(){
    setState(() {
      loading = true;
    });
    _auth.signInWithEmailAndPassword(
        email: emailController.text.toString(),
        password: passwordController.text.toString(),
    ).then((value){
      setState(() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => PostScreen()));
        loading = false;
      });
      utls().toastMessage(value.user!.email.toString());
    }).onError((error, stackTrace){
      debugPrint(error.toString());
      utls().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return
      WillPopScope(
      onWillPop: ()async{
        SystemNavigator.pop();
        return true;
      },
      child:
      Scaffold(
        appBar: AppBar(
          title: Center(child: Text('LOG IN')),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formkey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,

                        validator: (password){
                          if(password == null || password.isEmpty){
                            return "Please Enter your Email";
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                          hintText: 'Email',
                          helperText: 'Example abs@gmail.com',
                          prefixIcon: Icon(Icons.alternate_email),
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        keyboardType: TextInputType.emailAddress,
                        validator: (email){
                          if(email == null || email.isEmpty){
                            return "Please Enter your Password";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          helperText: 'Example abs@gmail.com',
                          prefixIcon: Icon(Icons.password)
                        ),
                      ),
                    ],
                  )),
              SizedBox(
                height: 50.0,
              ),
              RoundButton(
                title: 'Login',
                  loading : loading,
                onTap: (){
                  if(_formkey.currentState!.validate()){
                    Login();

                  }

                },
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpScreen() ));
                  }, child: Text("Sign Up")),
                ],
              ),
              InkWell(
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => loginWithPhoneNumber()));
                },
                child: Container(
                  height: 50.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(
                      color: Colors.deepPurple
                    ),
                  ),
                  child: Center(
                      child: Text('Login With Phone'),
                  ),
                ),
              ),
            ],
          ),

        ),
      ),
    );
  }
}
