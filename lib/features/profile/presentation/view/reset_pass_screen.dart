import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/shared/widgets/default_text_field.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/core/utils/helper/validation_helper.dart';
import 'package:movies_app/features/profile/cubit/profile_cubit.dart';
import 'package:movies_app/features/profile/cubit/profile_states.dart';
import 'package:movies_app/features/profile/data/model/reset_request.dart';
import 'package:movies_app/features/profile/presentation/view/profile.dart';

class ResetPassScreen extends StatefulWidget {
  static const String routeName = 'forget-pass-screen';
  const ResetPassScreen({super.key});

  @override
  State<ResetPassScreen> createState() => _ResetPassScreenState();
}

class _ResetPassScreenState extends State<ResetPassScreen> {
  final TextEditingController oldPasswordController = TextEditingController();

  final TextEditingController newPasswordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  AwesomeDialog? _awesomeLoginDialog;

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileStates>(
      listener: (context, state) {
        if (state is ResetLoading) {
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
        } else if (state is ResetError) {
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
        } else if (state is ResetSuccess) {
          _awesomeLoginDialog!.dismiss();
          _awesomeLoginDialog = AwesomeDialog(
            onDismissCallback: (type) {
              Navigator.pushReplacementNamed(context, Profile.routeName);
            },
            dialogBackgroundColor: ThemeColors.yellow,
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            titleTextStyle: HelperFunction.textTheme(context)
                .bodyMedium!
                .copyWith(color: ThemeColors.black),
            title: "Password Reset Successfully",
            btnOkColor: ThemeColors.green,
            btnOkOnPress: () {},
          )..show();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
          title: const Text('Reset Password'),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.0.w,
              ),
              child: Form(
                key: _key,
                child: Column(
                  children: [
                    Image.asset(
                      AppAssets.forgetPasswordImage,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    DefaultTextFormField(
                      textEditingController: oldPasswordController,
                      hintText: 'Oldpassword',
                      prefixImageName: 'lock',
                      validator: (value) {
                        return ValidationHelper.isValidPassword(value);
                      },
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    DefaultTextFormField(
                      textEditingController: newPasswordController,
                      hintText: 'Newpassword',
                      prefixImageName: 'lock',
                      validator: (value) {
                        return ValidationHelper.isValidPassword(value);
                      },
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 16.h,
                    ),
                    CustomElevatedButton(
                      onPressed: () {
                        if (_key.currentState!.validate()) {
                          context.read<ProfileCubit>().resetPassword(
                                ResetRequest(
                                    oldPassword: oldPasswordController.text,
                                    newPassword: newPasswordController.text),
                              );
                        }
                      },
                      child: const Text("Reset Password"),
                    ),
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
