import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/shared/widgets/default_text_field.dart';
import 'package:movies_app/core/shared/widgets/avatar_images.dart';
import 'package:movies_app/core/utils/helper/validation_helper.dart';
import 'package:movies_app/features/auth/presentation/views/login.dart';
import 'package:movies_app/features/update-profile/cubit/update_profile_cubit.dart';
import 'package:movies_app/features/update-profile/cubit/update_profile_states.dart';
import 'package:movies_app/features/update-profile/data/model/update_profile_request.dart';
import 'package:movies_app/features/update-profile/presentation/widgets/custom_bottom_sheet.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({super.key});

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  int selectedAvatarIndex = 7;
  final TextEditingController _emailController = TextEditingController();
  AwesomeDialog? _awesomeUpdateProfileDialog;
  AwesomeDialog? _awesomeDeleteProfileDialog;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileStates>(
      listener: (context, state) {
        if (state is UpdateProfileLoading) {
          _awesomeUpdateProfileDialog = AwesomeDialog(
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
        } else if (state is UpdateProfileError) {
          _awesomeUpdateProfileDialog!.dismiss();
          _awesomeUpdateProfileDialog = AwesomeDialog(
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
        } else if (state is UpdateProfileSuccess) {
          _awesomeUpdateProfileDialog!.dismiss();
          _awesomeUpdateProfileDialog = AwesomeDialog(
            onDismissCallback: (type) {},
            dialogBackgroundColor: ThemeColors.yellow,
            context: context,
            dialogType: DialogType.success,
            animType: AnimType.topSlide,
            titleTextStyle: HelperFunction.textTheme(context)
                .bodyMedium!
                .copyWith(color: ThemeColors.black),
            title: state.message,
            btnOkColor: ThemeColors.green,
            btnOkOnPress: () {},
          )..show();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 40.h),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (BuildContext context) {
                      return CustomBottomSheet(
                        selectedAvatarIndex: selectedAvatarIndex,
                        onAvatarSelected: (index) {
                          setState(() {
                            selectedAvatarIndex = index;
                          });
                        },
                      );
                    },
                  );
                },
                child: Center(
                  child: Image.asset(
                    AvatarImages.avatarImages[selectedAvatarIndex],
                    width: 150.w,
                    height: 150.h,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              DefaultTextFormField(
                hintText: 'email',
                prefixImageName: 'email',
                textEditingController: _emailController,
                textInputType: TextInputType.emailAddress,
                validator: (email) => ValidationHelper.isValidEmail(email),
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: EdgeInsets.only(left: 8.w),
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {},
                  child: Text(
                    'Reset password',
                    style: HelperFunction.textTheme(context).bodyMedium,
                  ),
                ),
              ),
              const Spacer(),
              BlocListener<UpdateProfileCubit, UpdateProfileStates>(
                listener: (context, state) {
                  if (state is DeleteProfileLoading) {
                    _awesomeDeleteProfileDialog = AwesomeDialog(
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
                  } else if (state is DeleteProfileError) {
                    _awesomeDeleteProfileDialog!.dismiss();
                    _awesomeDeleteProfileDialog = AwesomeDialog(
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
                  } else if (state is DeleteProfileSuccess) {
                    _awesomeDeleteProfileDialog!.dismiss();
                    _awesomeDeleteProfileDialog = AwesomeDialog(
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
                      title: state.message,
                      btnOkColor: ThemeColors.green,
                      btnOkOnPress: () {},
                    )..show();
                  }
                },
                child: CustomElevatedButton(
                  onPressed: () async {
                    await context.read<UpdateProfileCubit>().deleteProfile();
                  },
                  buttonStyle: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 55.h),
                    backgroundColor: ThemeColors.red,
                    foregroundColor: ThemeColors.white,
                  ),
                  child: const Text('Delete Account'),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              CustomElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.read<UpdateProfileCubit>().updateProfile(
                          UpdateProfileRequest(
                            email: _emailController.text,
                            avaterId: selectedAvatarIndex,
                          ),
                        );
                  }
                },
                child: const Text("Update Data"),
              ),
              SizedBox(
                height: 16.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
