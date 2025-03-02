class UserModel {
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avaterId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  const UserModel({
    required this.email,
    required this.password,
    required this.name,
    required this.phone,
    required this.avaterId,
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'] as String,
        password: json['password'] as String,
        name: json['name'] as String,
        phone: json['phone'] as String,
        avaterId: json['avaterId'] as int,
        id: json['_id'] as String,
        createdAt: DateTime.parse(json['createdAt'] as String),
        updatedAt: DateTime.parse(json['updatedAt'] as String),
        v: json['__v'] as int,
      );
}
