import 'package:cookingandrecipe/screens/editScreen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen(
      {super.key, required this.avatar, required this.fullName});
  final String avatar;
  final String fullName;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            // automaticallyImplyLeading: false,
            titleSpacing: 0.0,
            toolbarHeight: 80,
            title: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => Editscreen(
                                    avatar: widget.avatar,
                                    fullName: widget.fullName)));
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.avatar))),
                      ),
                    )),
                SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.fullName,
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      '@_${widget.fullName}',
                      style: TextStyle(fontSize: 14),
                    )
                  ],
                )
              ],
            ),
            actions: [
              GestureDetector(
                child: Icon(Icons.settings),
                onTap: () {
                  print('setting');
                },
              ),
              SizedBox(
                width: 10,
              ),
              PopupMenuButton<String>(
                icon: Icon(Icons.edit),
                itemBuilder: (BuildContext ctx) => [
                  const PopupMenuItem<String>(
                      value: 'Edit', child: Text('Chỉnh sửa thông tin'))
                ],
                onSelected: (String result) {
                  if (result == 'Edit') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (ctx) => Editscreen(
                                avatar: widget.avatar,
                                fullName: widget.fullName)));
                  }
                },
              ),
              SizedBox(
                width: 10,
              )
            ],
            bottom: TabBar(
                labelColor: Colors.black,
                indicatorColor: Colors.orange,
                indicatorWeight: 5,
                tabs: [
                  Tab(
                    text: 'Món đã lưu',
                  ),
                  Tab(
                    text: 'Món của tôi',
                  ),
                ]),
          ),
          body: TabBarView(children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: TextField(
                  decoration: InputDecoration(
                filled: true,
                hintText: 'Tìm Trong 0 Món',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              )),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 50),
              child: TextField(
                  decoration: InputDecoration(
                filled: true,
                hintText: 'Tìm Trong 0 Món',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    width: 1.0,
                    color: Colors.grey,
                  ),
                ),
              )),
            ),
          ])),
    );
  }
}
