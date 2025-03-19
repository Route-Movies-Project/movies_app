import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/auth/presentation/widgets/register_body.dart';
import 'package:movies_app/features/auth/presentation/widgets/register_header.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String routeName = '/register';

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  int selectedAvatarId = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("register".tr()),
      ),
      body: SafeArea(
        child: Column(
          children: [
            RegisterHeader(
              onPageChanged: (index, reason) {
                setState(() {
                  selectedAvatarId = index;
                });
              },
            ),
            RegisterBody(
              selectedAvatarId: selectedAvatarId,
            ),
          ],
        ),
      ),
    );
  }
}
