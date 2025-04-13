import 'package:movies_app/features/auth/data/model/login_response.dart';
import 'package:movies_app/features/auth/domain/entities/token.dart';

extension TokenMapper on LoginResponse {
  Token get toEntity => Token(token: token);
}
