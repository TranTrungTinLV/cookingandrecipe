import 'package:cookingandrecipe/shared/models/auth.models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalData {
  final Future<SharedPreferences> _pref = SharedPreferences.getInstance();

  final String _userDataKey = 'userDataKey';
  Future<AuthModel?> getUserData() async {
    final pref = await _pref;
    final String? userStringModel = pref.getString(_userDataKey);
    if (userStringModel == null) {
      return null;
    } else {
      return AuthModel.fromJson(userStringModel);
    }
    ;
  }

  Future<void> setUserData(AuthModel authModel) async {
    final pref = await _pref;
    await pref.setString(_userDataKey, authModel.toJson());
  }

  Future<void> clearUserData() async {
    final pref = await _pref;
    await pref.clear();
  }
}
