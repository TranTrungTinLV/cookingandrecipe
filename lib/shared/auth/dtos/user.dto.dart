
import 'dart:convert';

class UserDto{
  UserDto({required this.username,required this.password,required this.email});
  String username;
  String password;
  String email;
  Map<String,dynamic> toMap(){
    return {
      'username': username,
      'password': password,
      'email': email,
    };
  }
  factory UserDto.fromMap(Map<String, dynamic> map) {
    return UserDto(
      username: map['username'],
      email: map['email'],
      password: map['password'],
    );
  }
  String toJson() => json.encode(toMap());
  factory UserDto.fromJson(String source) =>
      UserDto.fromMap(json.decode(source));
}