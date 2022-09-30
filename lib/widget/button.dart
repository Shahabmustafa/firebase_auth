import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  RoundButton({required this.title, required this.onTap, this.loading = false});
  final String title;
  final VoidCallback onTap;
  final bool loading;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
          color: Colors.deepPurple,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: loading ? CircularProgressIndicator(strokeWidth: 3,color: Colors.white,) :
          Text(title, style: TextStyle(color: Colors.white,),),
        ),
      ),
    );
  }
}
