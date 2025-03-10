import 'package:injectable/injectable.dart';
import 'package:movies_app/core/utils/constants/shared_prefs.dart';
import 'package:movies_app/features/auth/data/data_source/local/auth_local_data_source.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: AuthLocalDataSource)
class AuthSharedPrefsDataSource implements AuthLocalDataSource {
  final SharedPreferences _prefs;

  AuthSharedPrefsDataSource(this._prefs);

  @override
  Future<void> saveToken(String token) async {
    _prefs.setString(SharedPrefsConstants.tokenKey, token);
  }

  @override
  Future<String> getToken() async {
    String token = _prefs.getString(SharedPrefsConstants.tokenKey) ?? '';
    return token;
  }
}
