import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/shared/widgets/default_text_field.dart';
import 'package:movies_app/shared/widgets/avatar_images.dart';
import 'package:movies_app/update-profile/widgets/custom_bottom_sheet.dart';

class UpdateProfileWidget extends StatefulWidget {
  const UpdateProfileWidget({super.key});

  @override
  State<UpdateProfileWidget> createState() => _UpdateProfileWidgetState();
}

class _UpdateProfileWidgetState extends State<UpdateProfileWidget> {
  int selectedAvatarIndex = 7;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    usernameController.dispose();
    phoneController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
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
              hintText: 'User Name',
              prefixImageName: 'username',
              textEditingController: usernameController,
              textInputType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
            SizedBox(height: 20.h),
            DefaultTextFormField(
              hintText: 'Phone Number',
              prefixImageName: 'phone',
              textEditingController: phoneController,
              textInputFormatter:
                  FilteringTextInputFormatter.allow(RegExp(r'^\+?[0-9]*$')),
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
            SizedBox(
              height: 264.h,
            ),
            CustomElevatedButton(
              onPressed: () {},
              buttonStyle: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 55.h),
                backgroundColor: ThemeColors.red,
                foregroundColor: ThemeColors.white,
              ),
              child: const Text('Delete Account'),
            ),
            SizedBox(
              height: 20.h,
            ),
            CustomElevatedButton(
              onPressed: () {},
              child: const Text("Update Data"),
            ),
          ],
        ),
      ),
    );
  }
}
