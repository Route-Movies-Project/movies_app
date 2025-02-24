import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/widgets/custom_elevated_button.dart';
import 'package:movies_app/widgets/default_text_field.dart';

class ForgetPassScreen extends StatelessWidget {
  static const String routeName = 'forget-pass-screen';
  ForgetPassScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('Forget Password'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  AppAssets.forgetPasswordImage,
                  height: MediaQuery.of(context).size.height * 0.5,
                  fit: BoxFit.fill,
                ),
                const SizedBox(
                  height: 12,
                ),
                DeafultTextFormField(
                  hintText: 'Email',
                  prefixImageName: 'email',
                  textEditingController: emailController,
                  // textInputFormatter: FilteringTextInputFormatter.allow(
                  //   RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
                  // ),
                ),
                const SizedBox(
                  height: 12,
                ),
                CustomElevatedButton(
                  onPressed: () {},
                  child: const Text("Verify Email"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
