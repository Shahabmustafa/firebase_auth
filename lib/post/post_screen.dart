import 'package:company_name/post/post_add.dart';
import 'package:company_name/view/auth/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

final auth = FirebaseAuth.instance;

class _PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post'),
        actions: [
          IconButton(onPressed: (){
            auth.signOut().then((value){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
            });
          },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => PostAdd() ));
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
