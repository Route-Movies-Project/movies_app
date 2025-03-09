import 'package:movies_app/core/utils/constants/shared_prefs.dart';
import 'package:movies_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthSharedPrefsDataSource implements AuthLocalDataSource {
  @override
  Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(SharedPrefsConstants.tokenKey, token);
  }

  @override
  Future<String> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(SharedPrefsConstants.tokenKey) ?? '';
  }
}
