class UpdateProfileRequest {
  final String email;
  final int avaterId;

  const UpdateProfileRequest({required this.email, required this.avaterId});

  Map<String, dynamic> toJson() => {
        'email': email,
        'avaterId': avaterId,
      };
}
