import 'package:flutter/material.dart';

import '../screens/DetailScreen.dart';

class CardItems extends StatelessWidget {
  const CardItems({super.key});

  @override
  Widget build(BuildContext context) {
    return   Card(
      clipBehavior: Clip.hardEdge,
      elevation: 2,

      child: GestureDetector(
        onTap: (){
          print("Card");
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DetailScreen()));
          },
        child: Stack(

            children: [
              Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                    shape: BoxShape.rectangle,

                    image: DecorationImage(
                        opacity: 0.8,
                        fit: BoxFit.cover,
                        repeat: ImageRepeat.noRepeat,
                        image: NetworkImage('http://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRvC27D9KlxeEham1w-Wpd_pu3hd4A-OywxRbdnx9JFLpcTD7dfL0bD_WI6Ro8QkzrPLkBMzA9osrMpi4JSP5Y'))
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  left: 10,
                  child: Text("Hello",style: TextStyle(color: Colors.white, fontSize: 18),))
            ]
        ),
      ),
    );
  }
}
