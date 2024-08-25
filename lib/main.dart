import 'package:cookingandrecipe/screens/home.dart';
import 'package:cookingandrecipe/screens/tab.dart';
import 'package:cookingandrecipe/widget/card_items.dart';
import 'package:flutter/material.dart';

void main (){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> {
  bool isFocusColor = false;
  final FocusNode _focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      setState(() {
        isFocusColor = _focusNode.hasFocus;
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _focusNode.dispose();
  }
  @override
  Widget build(BuildContext context) {


    return MaterialApp(

      home: TabScreen(focusNode: _focusNode, isFocusColor: isFocusColor)
    );
  }
}
