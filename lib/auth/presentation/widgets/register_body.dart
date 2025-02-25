import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/core/utils/helper/validation_helper.dart';
import 'package:movies_app/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/shared/widgets/default_text_field.dart';
import 'package:movies_app/shared/widgets/language_toggle_swtich.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({super.key});

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int languageValue = 0;

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 15.h,
                ),
                DeafultTextFormField(
                  textEditingController: nameController,
                  hintText: 'Name',
                  prefixImageName: 'name',
                ),
                SizedBox(
                  height: 24.h,
                ),
                DeafultTextFormField(
                  textEditingController: emailController,
                  hintText: 'Email',
                  prefixImageName: 'email',
                  validator: (value) {
                    return ValidationHelper.isValidEmail(value);
                  },
                ),
                SizedBox(
                  height: 24.h,
                ),
                DeafultTextFormField(
                  textEditingController: passwordController,
                  hintText: 'password',
                  prefixImageName: 'lock',
                  validator: (value) {
                    return ValidationHelper.isValidPassword(value);
                  },
                  isPassword: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                DeafultTextFormField(
                  textEditingController: confirmPasswordController,
                  hintText: 'confirm password',
                  prefixImageName: 'lock',
                  validator: (confirmPassword) {
                    return ValidationHelper.isValidConfirmPassword(
                      confirmPassword,
                      passwordController,
                    );
                  },
                  isPassword: true,
                ),
                SizedBox(
                  height: 24.h,
                ),
                DeafultTextFormField(
                  textEditingController: confirmPasswordController,
                  hintText: 'Phone Number',
                  prefixImageName: 'phone',
                  textInputFormatter: FilteringTextInputFormatter.allow(
                    RegExp(r'^(010|011|012|015)?[0-9]{0,8}$'),
                  ),
                  validator: (value) {
                    return ValidationHelper.validateEgyptianPhoneNumber(value);
                  },
                  isPassword: false,
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                CustomElevatedButton(
                  child: const Text("Create Account"),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {}
                  },
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.02,
                ),
                Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already Have Account ? ",
                        style: HelperFunction.textTheme(context)
                            .bodyMedium!
                            .copyWith(
                              fontSize: 14.sp,
                            ),
                      ),
                      TextSpan(
                        text: "Login",
                        recognizer: TapGestureRecognizer()..onTap = () {},
                        style: HelperFunction.textTheme(context)
                            .bodyMedium!
                            .copyWith(
                              fontSize: 14.sp,
                              color: ThemeColors.yellow,
                            ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                LanguageToggleSwtich(
                  languageValue: languageValue,
                  onChanged: (i) {
                    setState(
                      () => languageValue = i,
                    );
                  },
                ),
                SizedBox(
                  height: 18.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
