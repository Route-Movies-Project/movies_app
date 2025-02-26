import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/shared/widgets/default_text_field.dart';

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
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.0.w,
            ),
            child: Column(
              children: [
                Image.asset(
                  AppAssets.forgetPasswordImage,
                ),
                SizedBox(
                  height: 12.h,
                ),
                DefaultTextFormField(
                  hintText: 'Email',
                  prefixImageName: 'email',
                  textEditingController: emailController,
                  // textInputFormatter: FilteringTextInputFormatter.allow(
                  //   RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'),
                  // ),
                ),
                SizedBox(
                  height: 12.h,
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
