import 'package:cookingandrecipe/screens/Home/home.dart';
import 'package:cookingandrecipe/screens/feedback/sendFeedBack.dart';
import 'package:flutter/material.dart';

import 'mealScreen.dart';

class TabScreen extends StatefulWidget {
  TabScreen({
    super.key,
    required this.focusNode,
    required this.isFocusColor,
    this.avatar,
    this.fullName,
  });
  final FocusNode focusNode;
  final bool isFocusColor;
  final String? avatar;
  final String? fullName;
  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedPageIndex = 0;
  void selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void onSelectScreen(String indetifier) async {
    if (indetifier == "feedback") {
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => SendFeedback()));
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomePage(
      focusNode: widget.focusNode,
      isFocusColor: widget.isFocusColor,
      drawer: () {
        widget.isFocusColor
            ? _scaffoldKey.currentState?.openDrawer()
            : _scaffoldKey.currentState?.closeDrawer();
      },
      avatar: widget.avatar ??
          'https://www.shutterstock.com/image-vector/chef-avatar-white-shirt-hat-600nw-2173450017.jpg',
      fullName: widget.fullName ?? '',
    );
    if (_selectedPageIndex == 1) {
      activePage = MealsScreen(
        title: 'Favorite',
      );
    }
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            DrawerHeader(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).colorScheme.primaryContainer,
                    Theme.of(context)
                        .colorScheme
                        .primaryContainer
                        .withOpacity(0.8)
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                ),
                child: TextButton(
                  onPressed: () {
                    print("Đăng nhập");
                  },
                  child: ListTile(
                    title: Row(
                      children: [
                        Icon(
                          Icons.fastfood,
                          size: 30,
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Đang nhập",
                              style: TextStyle(
                                  fontSize: 24, fontWeight: FontWeight.w500),
                            ),
                            Text(
                              "Lưu và tạo thành công",
                              style: TextStyle(fontSize: 13),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )),
            ListTile(
              title: Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(children: [
                  Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'Cài đặt',
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                          color: Theme.of(context).colorScheme.onBackground,
                          fontSize: 24,
                        ),
                  ),
                ]),
              ),
              onTap: () {
                // onSelectScreen('meals');
              },
            ),
            ListTile(
              title: Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.send,
                      size: 30,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Gửi Phản Hồi',
                      style: Theme.of(context).textTheme.titleSmall!.copyWith(
                            color: Theme.of(context).colorScheme.onBackground,
                            fontSize: 24,
                          ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                onSelectScreen('feedback');
              },
            )
          ],
        ),
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: selectPage,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Tìm Kiếm'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Món ngon của bạn'),
        ],
      ),
    );
  }
}
