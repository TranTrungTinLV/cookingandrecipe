import 'package:cookingandrecipe/services/user_local_storage_service.dart';
import 'package:cookingandrecipe/shared/auth/repositories/auth_repositories.dart';
import 'package:cookingandrecipe/shared/models/auth.models.dart';

class AuthController {
  late AuthModel user;
  late AuthRepositories _authRepository;
  late UserLocalData _storageService;
  AuthController({
    required AuthRepositories authRepository,
    required UserLocalData storageService,
  }) {
    _authRepository = authRepository;
    _storageService = storageService;
  }

  Future<void> login(String username, String password) async {
    user = await _authRepository.login(username, password);
    if (user != null) {
      await _storageService.setUserData(user);
      print('Access Token: ${user.accessToken}');
    }
  }

  Future<AuthModel> getProfile() async {
    final AuthModel? userProfile = await _storageService.getUserData();
    print('profile $userProfile');
    if (userProfile != null) {
      user = await _authRepository.getProfile(userProfile.accessToken!);
      // print('fullname ${user.fullName}');
      await _storageService.setUserData(user);
      return user;
    } else {
      throw Exception('No user data found');
    }
  }

  String getCustomAvatarUrl(
      {String width = 'auto', int height = 500, String crop = 'scale'}) {
    return user.getCustomAvatarUrl(width: width, height: height, crop: crop);
  }
}
