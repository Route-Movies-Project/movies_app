import 'package:movies_app/features/auth/data/model/user_model.dart';
import 'package:movies_app/features/auth/domain/entities/user.dart';

extension UserMapper on UserModel {
  User get toEntity => User(
        email: email,
        password: password,
        name: name,
        phone: phone,
        avaterId: avaterId,
        id: id,
        createdAt: createdAt,
        updatedAt: updatedAt,
        v: v,
      );
}
