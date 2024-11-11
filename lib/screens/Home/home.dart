import 'package:cookingandrecipe/screens/profileScreen.dart';
import 'package:flutter/material.dart';

import '../../widget/card_items.dart';

class HomePage extends StatelessWidget {
  HomePage(
      {super.key,
      required this.focusNode,
      required this.isFocusColor,
      required this.drawer,
      required this.avatar,
      required this.fullName});
  final FocusNode focusNode;
  final bool isFocusColor;
  final void Function() drawer;
  final String avatar;
  final String fullName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.orange,
          onPressed: () {},
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
      appBar: AppBar(
        titleSpacing: 30.0,
        automaticallyImplyLeading: false,
        title: Text(
          "Logo",
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
          CircleAvatar(
              child: GestureDetector(
            onTap: isFocusColor
                ? drawer
                : () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => ProfileScreen(
                                  avatar: avatar,
                                  fullName: fullName,
                                )));
                  },
            child: Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(avatar))),
            ),
          )),
          SizedBox(
            width: 20,
          )
        ],
        flexibleSpace: SizedBox(
          height: 30,
        ),
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(60.0),
            child: Container(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    focusNode: focusNode,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            width: 1.0,
                            // color: Colors.red,
                          )),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color:
                                Color(0xffCDCEC8), // Màu viền khi không focus

                            width: 0.5,
                          )),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(
                            color: Color(0xffD2D2D2),
                            width: 1,
                            // color: ,
                          )),
                      hintText: "Gõ tìm kiếm tên các tài nguyên",
                      hintStyle: TextStyle(
                          color: isFocusColor
                              ? Color(0xff999997)
                              : Color(0xff7E7E7E)),
                      prefixIcon: Icon(Icons.search),
                      filled: true,
                      fillColor:
                          isFocusColor ? Colors.white : Color(0xffF5F6F0),
                      contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                    ),
                  )),
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            Row(
              // mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Danh sách món ăn",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "Xem thêm",
                      style: TextStyle(fontSize: 12),
                    )),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            // Container(
            //   height: constraints.maxHeight * .6,
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                CardItems(),
                CardItems(),
                CardItems(),
                CardItems(),
                CardItems(),
                CardItems(),
                CardItems(),
                CardItems(),
                // Thêm các item khác tại đây
              ],
            ),
            // ),
          ],
        ),
      ),
    );
  }
}
