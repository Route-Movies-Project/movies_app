import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/auth/presentation/views/forget_pass_screen.dart';
import 'package:movies_app/auth/presentation/widgets/custom_divider.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/core/utils/helper/validation_helper.dart';
import 'package:movies_app/auth/presentation/views/register.dart';
import 'package:movies_app/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/shared/widgets/default_text_field.dart';
import 'package:movies_app/shared/widgets/language_toggle_swtich.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _text = TextEditingController();
  final _password = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int languageValue = 0;

  @override
  void dispose() {
    _password.dispose();
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(height: 67.h),
                  Image.asset(AppAssets.appLogo),
                  SizedBox(height: 60.h),
                  DefaultTextFormField(
                    hintText: 'Email',
                    prefixImageName: 'email',
                    validator: (email) {
                      return ValidationHelper.isValidEmail(email);
                    },
                  ),
                  SizedBox(height: 24.h),
                  DefaultTextFormField(
                    hintText: 'Password',
                    isPassword: true,
                    prefixImageName: 'lock',
                    validator: (password) {
                      return ValidationHelper.isValidPassword(password);
                    },
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerRight,
                    child: InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed(ForgetPassScreen.routeName),
                      child: Text(
                        "Forget Password ?",
                        style: textTheme.bodyMedium!.copyWith(
                          color: ThemeColors.yellow,
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    onPressed: () {},
                    child: const Text('Login'),
                  ),
                  SizedBox(height: 20.h),
                  Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Don’t Have Account ? ',
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 14.sp,
                          ),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushNamed(Register.routeName);
                            },
                          text: 'Create One',
                          style: textTheme.bodyMedium!.copyWith(
                            color: ThemeColors.yellow,
                            fontSize: 14.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  const CustomDivider(),
                  SizedBox(height: 20.h),
                  CustomElevatedButton(
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset("assets/icons/icon _google_.svg"),
                        SizedBox(width: 10.w),
                        const Text("Login With Google"),
                      ],
                    ),
                  ),
                  SizedBox(height: 34.h),
                  LanguageToggleSwtich(
                    languageValue: languageValue,
                    onChanged: (i) {
                      setState(
                        () => languageValue = i,
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
