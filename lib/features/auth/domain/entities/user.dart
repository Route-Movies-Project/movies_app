class User {
  final String email;
  final String password;
  final String name;
  final String phone;
  final int avaterId;
  final String id;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  const User({
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
}
