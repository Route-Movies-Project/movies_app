import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:movies_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:movies_app/features/auth/data/model/register_request.dart';
import 'package:movies_app/features/auth/presentation/views/login.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/core/utils/helper/validation_helper.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/shared/widgets/default_text_field.dart';
import 'package:movies_app/core/shared/widgets/language_toggle_swtich.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({required this.selectedAvatarId, super.key});
  final int selectedAvatarId;
  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  AwesomeDialog? _awesomeRegisterDialog;
  int languageValue = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _phoneNumberController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthStates>(
      listener: (context, state) {
        if (state is RegisterLoading) {
          _awesomeRegisterDialog = AwesomeDialog(
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
        } else if (state is RegisterError) {
          _awesomeRegisterDialog!.dismiss();
          _awesomeRegisterDialog = AwesomeDialog(
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
        } else if (state is RegisterSuccess) {
          _awesomeRegisterDialog!.dismiss();
          _awesomeRegisterDialog = AwesomeDialog(
            onDismissCallback: (type) {
              Navigator.pushReplacementNamed(
                context,
                LoginScreen.routeName,
              );
            },
            dialogBackgroundColor: ThemeColors.yellow,
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            titleTextStyle: HelperFunction.textTheme(context)
                .bodyMedium!
                .copyWith(color: ThemeColors.black),
            title: "User Created Successfully",
            btnOkColor: ThemeColors.green,
            btnOkOnPress: () {},
          )..show();
        }
      },
      child: Expanded(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 15.h,
                  ),
                  DefaultTextFormField(
                    textEditingController: _nameController,
                    hintText: 'Name',
                    prefixImageName: 'name',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  DefaultTextFormField(
                    textEditingController: _emailController,
                    hintText: 'Email',
                    prefixImageName: 'email',
                    textInputType: TextInputType.emailAddress,
                    validator: (value) {
                      return ValidationHelper.isValidEmail(value);
                    },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  DefaultTextFormField(
                    textEditingController: _passwordController,
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
                  DefaultTextFormField(
                    textEditingController: _confirmPasswordController,
                    hintText: 'confirm password',
                    prefixImageName: 'lock',
                    validator: (confirmPassword) {
                      return ValidationHelper.isValidConfirmPassword(
                        confirmPassword,
                        _passwordController,
                      );
                    },
                    isPassword: true,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  DefaultTextFormField(
                    textEditingController: _phoneNumberController,
                    hintText: 'Phone Number',
                    prefixImageName: 'phone',
                    textInputFormatter: FilteringTextInputFormatter.allow(
                      RegExp(r'^\+?(010|011|012|015)?[0-9]{0,15}$'),
                    ),
                    validator: (value) {
                      return ValidationHelper.validateEgyptianPhoneNumber(
                          value);
                    },
                    isPassword: false,
                  ),
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.02,
                  ),
                  CustomElevatedButton(
                    child: const Text("Create Account"),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await getIt<AuthCubit>().regsiter(
                          RegisterRequest(
                            name: _nameController.text,
                            email: _emailController.text,
                            password: _passwordController.text,
                            confirmPassword: _confirmPasswordController.text,
                            phone: _phoneNumberController.text,
                            avaterId: widget.selectedAvatarId,
                          ),
                        );
                      }
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
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                context,
                                LoginScreen.routeName,
                              );
                            },
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
      ),
    );
  }
}
