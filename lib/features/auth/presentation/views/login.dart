import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/auth/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/cubit/auth_states.dart';
import 'package:movies_app/features/auth/data/model/login_request.dart';
import 'package:movies_app/features/auth/presentation/views/reset_pass_screen.dart';
import 'package:movies_app/features/auth/presentation/widgets/custom_divider.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/core/utils/helper/validation_helper.dart';
import 'package:movies_app/features/auth/presentation/views/register.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/shared/widgets/default_text_field.dart';
import 'package:movies_app/core/shared/widgets/language_toggle_swtich.dart';
import 'package:movies_app/features/profile/presentation/view/profile.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AwesomeDialog? _awesomeLoginDialog;
  int languageValue = 0;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is LoginLoading) {
          _awesomeLoginDialog = AwesomeDialog(
            dismissOnTouchOutside: false,
            dialogBackgroundColor: ThemeColors.yellow,
            context: context,
            dialogType: DialogType.noHeader,
            animType: AnimType.topSlide,
            title: 'Loading....',
            btnOk: Padding(
              padding: EdgeInsets.all(16.h),
              child: const LoadingIndicator(
                color: ThemeColors.black,
              ),
            ),
          )..show();
        } else if (state is LoginError) {
          _awesomeLoginDialog!.dismiss();
          _awesomeLoginDialog = AwesomeDialog(
            dialogBackgroundColor: ThemeColors.yellow,
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: state.errorMessage,
            titleTextStyle: HelperFunction.textTheme(context)
                .bodyMedium!
                .copyWith(color: ThemeColors.black),
            btnOkColor: ThemeColors.red,
            btnOkOnPress: () {},
          )..show();
        } else if (state is LoginSuccess) {
          _awesomeLoginDialog!.dismiss();
          _awesomeLoginDialog = AwesomeDialog(
            onDismissCallback: (type) {
              Navigator.pushReplacementNamed(
                context,
                Profile.routeName,
              );
              context.read<AuthCubit>().close();
            },
            dialogBackgroundColor: ThemeColors.yellow,
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            titleTextStyle: HelperFunction.textTheme(context)
                .bodyMedium!
                .copyWith(color: ThemeColors.black),
            title: state.loginResponse.message,
            btnOkColor: ThemeColors.green,
            btnOkOnPress: () {},
          )..show();
        }
      },
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(height: 67.h),
                    Image.asset(AppAssets.appLogo),
                    SizedBox(height: 60.h),
                    DefaultTextFormField(
                      textEditingController: _emailController,
                      hintText: 'Email',
                      prefixImageName: 'email',
                      textInputType: TextInputType.emailAddress,
                      validator: (email) {
                        return ValidationHelper.isValidEmail(email);
                      },
                    ),
                    SizedBox(height: 24.h),
                    DefaultTextFormField(
                      hintText: 'Password',
                      textEditingController: _passwordController,
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
                            .pushNamed(ResetPassScreen.routeName),
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
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                                LoginRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      child: Text(
                        "login".tr(),
                      ),
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
                        context.setLocale(
                          languageValue == 0
                              ? const Locale('en')
                              : const Locale('ar'),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
