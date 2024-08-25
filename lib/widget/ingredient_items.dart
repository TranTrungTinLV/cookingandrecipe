import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:flutter/material.dart';

class IngredientItems extends StatelessWidget {
  const IngredientItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20,left: 30,right: 30),
        child: Text("tôm"),
        height: 30,
        width: double.infinity,
        decoration:  DottedDecoration(
          color: Colors.grey,
          strokeWidth: 1,
          linePosition: LinePosition.bottom,
        )
    );
  }
}
