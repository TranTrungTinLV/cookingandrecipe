import 'package:cookingandrecipe/screens/tab.dart';
import 'package:cookingandrecipe/services/user_local_storage_service.dart';
import 'package:cookingandrecipe/shared/auth/controller/auth.controller.dart';
import 'package:cookingandrecipe/shared/auth/repositories/auth_repositories.dart';
import 'package:cookingandrecipe/shared/models/auth.models.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key, required this.focusNode});
  final FocusNode focusNode;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = false;
  var _enterusername = '';
  var _enterpassword = '';
  var _enteremail = '';
  var _repeatpasword = '';
  bool? isChecked = false;
  bool isFocusColor = true;
  late AuthController _auth;

  @override
  void initState() {
    super.initState();
    _auth = AuthController(
      storageService: UserLocalData(),
      authRepository: AuthRepositories(),
    );
  }

  void _onSubmit() async {
    final isValid = _formKey.currentState!.validate();
    // RegExp emailRegex = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
    _formKey.currentState!.save();
    print(_enterusername);
    print(_enterpassword);
    print(_enteremail);
    print(_repeatpasword);
    // print(_enterpassword);
    // print(_repeatpasword);
    if (isValid) {
      try {
        await _auth.login(_enterusername, _enterpassword);
        AuthModel userProfile = await _auth.getProfile();
        setState(() {
          isFocusColor = false;
        });
        print(userProfile.email);
        print('groupID ${userProfile.groupId}');
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (ctx) => TabScreen(
                      focusNode: widget.focusNode,
                      isFocusColor: isFocusColor,
                      avatar: _auth.getCustomAvatarUrl(),
                      fullName: userProfile.fullName!,
                    )));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Đăng nhập thất bại: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } else if (!isChecked!) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Bạn phải chấp nhận điều khoản và điều kiện.'),
        backgroundColor: Colors.red,
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(children: [
        Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        'https://images.unsplash.com/photo-1543362906-acfc16c67564?q=80&w=1965&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
                    fit: BoxFit.cover,
                    opacity: 0.9),
                gradient:
                    LinearGradient(colors: [Colors.black45, Colors.black45]))),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black.withOpacity(0.1),
                Colors.black45.withOpacity(1)
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned.fill(
            child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      child: Image.asset('assets/images/logo.png'),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Text(
                      'Cook & Recipe',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: Container(
                          child: TextFormField(
                            keyboardType: TextInputType.name,
                            autocorrect: false,
                            validator: (value) {
                              if (value == null || value.trim().isEmpty) {
                                return 'name không hợp lệ';
                              }
                              return null;
                            }, 
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              hintText:
                                  _isLogin ? "Enter username" : "username",
                              hintStyle: TextStyle(color: Colors.grey.shade400),
                              filled: true,
                              fillColor: Colors.white,
                            ),
                            onSaved: (value) {
                              _enterusername = value!;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _isLogin
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                autocorrect: false,
                                validator: (value) {
                                  if (value == null ||
                                      value.trim().isEmpty ||
                                      !value.contains('@gmail.com') ||
                                      !value.contains('trantin@gmail.com')) {
                                    return 'email không hợp lệ';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _enteremail = value!;
                                },
                                textCapitalization: TextCapitalization.none,
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10))),
                                  hintText: "Enter email",
                                  filled: true,
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade400),
                                  fillColor: Colors.white,
                                ),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: TextFormField(
                          obscureText: true,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty
                                // || value.trim().length < 6
                                ) {
                              return 'mật khẩu tối thiểu từ 6 ký tự trở lên ';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            hintText: _isLogin ? "Enter password" : "password",
                            filled: true,
                            hintStyle: TextStyle(color: Colors.grey.shade400),
                            fillColor: Colors.white,
                          ),
                          onSaved: (value) {
                            _enterpassword = value!;
                          },
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _isLogin
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 50),
                              child: TextFormField(
                                obscureText: true,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Nhập lại mật khẩu không hợp lệ';
                                  }
                                  if (_repeatpasword != _enterpassword) {
                                    return 'Mật khẩu không khớp';
                                  }
                                  return null;
                                },
                                onSaved: (value) {
                                  _repeatpasword = value!;
                                },
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
                                    hintText: "Retype password",
                                    filled: true,
                                    hintStyle:
                                        TextStyle(color: Colors.grey.shade400),
                                    fillColor: Colors.white),
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      _isLogin
                          ? Container(
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              child: Row(
                                children: [
                                  Checkbox(
                                    value: isChecked,
                                    // shape: Sa,
                                    side: MaterialStateBorderSide.resolveWith(
                                      (states) => BorderSide(
                                          width: 1.0, color: Colors.orange),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        isChecked = value;
                                      });
                                    },

                                    checkColor: Colors.orange,
                                    activeColor: Colors.transparent,
                                  ),
                                  Text(
                                    "Accept terms & Condition",
                                    style: TextStyle(color: Colors.orange),
                                  )
                                ],
                              ),
                            )
                          : Container(),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 100),
                            width: double.infinity,
                            child: ElevatedButton(
                                onPressed: _onSubmit,
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xff129575)),
                                child: Text(
                                  _isLogin ? "Đăng ký" : "Đăng nhập",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                      color: Colors.white),
                                ))),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Divider(
                                height: 20,
                                thickness: 1,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 8),
                              child: Center(
                                child: Text(
                                  _isLogin
                                      ? 'Hoặc đăng ký với'
                                      : 'Hoặc đăng nhập với',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 13),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                height: 20,
                                thickness: 1,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                print('google');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                width: 44,
                                height: 44,
                                child: Image.network(
                                    'http://pngimg.com/uploads/google/google_PNG19635.png',
                                    fit: BoxFit.cover),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                print('google');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(0, 3),
                                      )
                                    ]),
                                width: 44,
                                height: 44,
                                alignment: Alignment.center,
                                child: FaIcon(
                                  color: Color(0xff035B81),
                                  size: 30,
                                  FontAwesomeIcons.facebook,

                                  // size: 44,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            _isLogin
                                ? 'Nếu bạn có tài khoản thì hãy'
                                : 'Nếu bạn chưa có tài khoản?',
                            style: TextStyle(
                                //if false => false else true
                                color: Colors.white,
                                fontSize: 11),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isLogin = !_isLogin;
                                });
                              },
                              child: Text(_isLogin ? 'Đăng nhập' : 'Đăng ký',
                                  style: TextStyle(
                                      color: Color(0xffFF9C00), fontSize: 11)))
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ))
      ]),
    );
  }
}
