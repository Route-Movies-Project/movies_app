import 'package:flutter/material.dart';
import 'package:movies_app/auth/presentation/widgets/register_body.dart';
import 'package:movies_app/auth/presentation/widgets/register_header.dart';

class Register extends StatelessWidget {
  const Register({super.key});
  static const String routeName = '/register';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            RegisterHeader(),
            RegisterBody(),
          ],
        ),
      ),
    );
  }
}
