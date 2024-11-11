import 'dart:convert';
import 'dart:io';

import 'package:cookingandrecipe/shared/models/auth.models.dart';
import 'package:cookingandrecipe/utils/constants.dart';
import 'package:http/http.dart' as http;

class AuthRepositories {
  final http.Client _client = http.Client();

  Future<AuthModel> login(String username, String password) async {
    final http.Response response = await _client.post(
      Uri.parse('$BASE_URL/api/auth/manager/login'),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // Successfully logged in
      final Map<String, dynamic> responseData = json.decode(response.body);
      return AuthModel.fromMap(responseData);
    } else {
      // Handle other error status codes
      throw Exception('Failed to login: ${response.statusCode}');
    }
  }

  Future<AuthModel> getProfile(String accessToken) async {
    final http.Response response = await _client.get(
      Uri.parse('$BASE_URL/api/users/profile'),
      headers: {
        HttpHeaders.authorizationHeader: 'Bearer $accessToken',
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      return AuthModel.fromMap(responseData);
    } else {
      throw Exception('Failed to fetch profile: ${response.statusCode}');
    }
  }
}
