import 'dart:ffi';

import 'package:company_name/utls/utils.dart';
import 'package:company_name/widget/button.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PostAdd extends StatefulWidget {
  const PostAdd({Key? key}) : super(key: key);

  @override
  State<PostAdd> createState() => _PostAddState();
}

class _PostAddState extends State<PostAdd> {

  bool loading = false;
  final databaseRef = FirebaseDatabase.instance.ref('Post');
  final addPostcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0,horizontal: 30.0),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            TextFormField(
              controller: addPostcontroller,
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Enter Your Post',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            RoundButton(
                title: 'Add Post',
                loading: loading,
                onTap: (){
                  setState(() {
                    loading = true;
                  });
              databaseRef.child('1').set({
                'title' : addPostcontroller.text.toString(),
              });
        // .then((value){
              //   setState(() {
              //     loading = false;
              //   });
              //   utls().toastMessage("Post Added");
              // }).onError((error, stackTrace){
              //   setState(() {
              //     loading = false;
              //   });
              //   utls().toastMessage(error.toString());
              // });
            }),
          ],
        ),
      ),
    );
  }
}
