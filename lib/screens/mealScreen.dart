import 'package:flutter/material.dart';


class MealsScreen extends StatelessWidget {
  MealsScreen({super.key,required  this.title,});
  final String title;

  @override
  Widget build(BuildContext context) {

    Widget content = Center(child: SizedBox(width: 200,child: Text('Uh Xin lỗi hiện tại đang có vấn đề xảy ra',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 30),)));
    // if(title == null){
    //   return content;
    // }
    return Scaffold(
      appBar: AppBar(
        title:  Text(title,) ,
        centerTitle: true,
      ),
      body: content
    );
  }
}
