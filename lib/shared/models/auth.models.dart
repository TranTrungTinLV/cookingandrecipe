// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:uuid/uuid.dart';

final uuid = Uuid();

class AuthModel {
  AuthModel(
      {String? slug,
      this.groupId,
      this.username,
      this.accessToken,
      this.avatar,
      this.createdDate,
      this.dateOfBirth,
      this.email,
      this.fullName})
      : slug = slug ?? uuid.v4();
  final String slug;
  final String? groupId;
  final String? username;
  final String? accessToken;
  final String? fullName;
  final String? email;
  final DateTime? dateOfBirth;
  final String? avatar;
  final String? createdDate;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'slug': slug,
      'groupId': groupId,
      'username': username,
      'accessToken': accessToken,
      'fullName': fullName,
      'email': email,
      'dateOfBirth': dateOfBirth?.millisecondsSinceEpoch, //mili
      'avatar': avatar,
      'createdDate': createdDate,
    };
  }

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      groupId: map['groupId'] as String?,
      slug: map['slug'] as String?,
      username: map['username'] as String?,
      accessToken: map['accessToken'] as String?,
      fullName: map['fullName'] as String?,
      email: map['email'] as String?,
      dateOfBirth: map['dateOfBirth'] != null
          ? DateTime.fromMillisecondsSinceEpoch(map['dateOfBirth'] as int)
          : null,
      avatar: map['avatar'] as String?,
      createdDate: map['createdDate'] as String?,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthModel.fromJson(String source) =>
      AuthModel.fromMap(json.decode(source) as Map<String, dynamic>);

  String getCustomAvatarUrl(
      {String width = 'auto', int height = 100, String crop = 'scale'}) {
    if (avatar == null || avatar!.isEmpty) {
      return 'default_avatar_url'; // Placeholder cho avatar mặc định
    }

    final uri = Uri.parse(avatar!);
    final segments = List<String>.from(uri
        .pathSegments); // Tạo một bản sao có thể chỉnh sửa của danh sách pathSegments

    // Thêm tham số thao tác hình ảnh của Cloudinary
    String transformation = 'w_$width,h_$height,c_$crop';

    // Chèn các tham số này vào URL
    segments.insert(segments.length - 2, transformation);

    // Trả về URL đã được chỉnh sửa
    return Uri(
      scheme: uri.scheme,
      host: uri.host,
      pathSegments: segments,
    ).toString();
  }
}
