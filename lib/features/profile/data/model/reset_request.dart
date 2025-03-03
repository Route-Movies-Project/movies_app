class ResetRequest {
  final String oldPassword;
  final String newPassword;

  ResetRequest({required this.oldPassword, required this.newPassword});

  Map<String, dynamic> toJson() => {
        'oldPassword': oldPassword,
        'newPassword': newPassword,
      };
}
