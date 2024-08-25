import 'package:cookingandrecipe/widget/ingredient_items.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      floatingActionButton: FloatingActionButton(backgroundColor: Colors.orange,onPressed: (){}, child: Icon(Icons.add,color: Colors.white,)),
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        iconTheme: IconThemeData(
            color: Colors.white
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications,color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.bookmark,color: Colors.white,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert,color: Colors.white,),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 400,
              child: Stack(
                children: [
                  Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRokH7fLa97Id7vBJ8EbR3NWx1Pb5brUc5KvQ&s",
                    height: 400,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.2), // Lớp phủ tối màu đen với độ mờ 0.3
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 10,left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Tôm rang thịt ba chỉ",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                  SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                          radius: 30,
                          child: GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuEGiONaSFRVRxczhIrqOFwNEPEKtx8b92KQ&s'))
                              ),
                            ),
                          )),
                      SizedBox(width: 10,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Trần Tín",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
                          SizedBox(height: 10,),
                          Text("Q7",style: TextStyle(fontSize: 14),),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20,left: 30,right: 30),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.grey),
                    bottom: BorderSide(color: Colors.grey),
                  )
              ),
              child: Center(child: Text('60 phút')),
            ),
            Container(
                padding: EdgeInsets.only(top: 50,left: 20),
                child: Text("Nguyên Liệu",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),)),
            Container(
              padding: EdgeInsets.only(top: 5,left: 20,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Khảu phần theo số lượng"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(child: GestureDetector(onTap: (){}, child: Icon(Icons.add,size: 20,))),
                      Container(child: Text("1")),
                      Container(child: GestureDetector(onTap: (){}, child: FaIcon(FontAwesomeIcons.subtract,size: 20,)))

                    ],
                  )
                ],
              ),
            ),
            Column(
              children: [
                IngredientItems(),
                IngredientItems(),
                IngredientItems(),
                IngredientItems(),
                IngredientItems(),
                IngredientItems(),
                IngredientItems(),
              ],
            ),
            Container(
                padding: EdgeInsets.only(top: 10,left: 20),

                child: Text("Cách Làm",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),)),
            Container(
              margin: EdgeInsets.only(top: 10,left: 20,right: 20),
              color: Colors.grey.shade200,
              height: 500,
            ),
            GestureDetector(onTap: (){}, child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10,left: 20,right: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey)
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 20,),
                  Text("Chia sẻ món")
                ],
              ),
            )),
            SizedBox(height: 50,),
            Center(
              child: Column(
                children: [
                  CircleAvatar(
                      radius: 40,
                      child: GestureDetector(
                        child: Container(
                          padding: EdgeInsets.only(top: 10,left: 20),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuEGiONaSFRVRxczhIrqOFwNEPEKtx8b92KQ&s'))
                          ),
                        ),
                      )),
                  Text("author"),
                  Text("Tran Tin",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),
                  Text("ngày 25 tháng 8, 2024"),

                ],
              ),
            ),
            GestureDetector(onTap: (){}, child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10,left: 20,right: 20),
              decoration: BoxDecoration(
                  color: Colors.black87,
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(color: Colors.grey)
              ),
              height: 50,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Kết bạn bếp",style: TextStyle(color: Colors.white),)
                ],
              ),
            )),
            SizedBox(height: 100,),
            Container(
              padding: EdgeInsets.only(top: 10,left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Bình Luận",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w700),),

                  ListTile(
                    title: Row(
                      children: [
                        CircleAvatar(
                            radius: 18,
                            child: GestureDetector(
                              child: Container(
                                padding: EdgeInsets.only(top: 10,left: 20),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                        image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuEGiONaSFRVRxczhIrqOFwNEPEKtx8b92KQ&s'))
                                ),
                              ),
                            )),
                        SizedBox(width: 10),
                        Expanded(child: TextField(
                            decoration: InputDecoration(
                              filled: true,

                              hintText: 'Thêm Bình Luận',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),

                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),

                              ),
                              enabledBorder:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                                borderSide: const BorderSide(
                                  width: 1.0,
                                  color: Colors.grey,
                                ),

                              ),
                            )
                        ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 100,)

                  // )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }}