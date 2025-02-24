import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/update-profile/widgets/avatar_images.dart';

class CustomBottomSheet extends StatelessWidget {
  CustomBottomSheet({
    super.key,
    required this.onAvatarSelected,
    required this.selectedAvatarIndex,
  });
  final Function(int) onAvatarSelected;

  final int selectedAvatarIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w, bottom: 16.h),
      child: Container(
        width: double.infinity,
        height: 410.h,
        decoration: BoxDecoration(
          color: ThemeColors.grey,
          borderRadius: BorderRadius.circular(24.r),
        ),
        child: Padding(
          padding: EdgeInsets.all(8.w),
          child: GridView.builder(
            itemCount: AvatarImages.avatarImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              bool isSelected = selectedAvatarIndex == index;
              return GestureDetector(
                onTap: () {
                  onAvatarSelected(index);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color.fromARGB(154, 255, 186, 59)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(
                      color: ThemeColors.yellow,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      AvatarImages.avatarImages[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
