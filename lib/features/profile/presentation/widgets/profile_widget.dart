import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/shared/widgets/avatar_images.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
import 'package:movies_app/core/utils/helper/helper_functions.dart';
import 'package:movies_app/features/auth/presentation/views/login.dart';
import 'package:movies_app/features/profile/cubit/profile_cubit.dart';
import 'package:movies_app/features/profile/cubit/profile_states.dart';
import 'package:movies_app/features/profile/presentation/view/update_profile.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProfileCubit>().getProfile();
    return Scaffold(
      body: BlocBuilder<ProfileCubit, ProfileStates>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const SizedBox.expand(
              child: LoadingIndicator(),
            );
          } else if (state is ProfileError) {
            return ErrorWidget(state.errorMessage);
          } else if (state is ProfileSuccess) {
            return Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: ThemeColors.grey,
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.h),
                        child: Row(
                          children: [
                            Column(
                              spacing: 15.h,
                              children: [
                                SizedBox(
                                  height: 52.h,
                                ),
                                SizedBox(
                                  height: 118.h,
                                  width: 118.w,
                                  child: Image.asset(
                                    AvatarImages
                                        .avatarImages[state.data.avaterId ?? 0],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Text(
                                  state.data.name ?? '',
                                  style: HelperFunction.textTheme(context)
                                      .bodyMedium!
                                      .copyWith(
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 46.w,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "12",
                                    style: HelperFunction.textTheme(context)
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  Text(
                                    "Wish List",
                                    style: HelperFunction.textTheme(context)
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 38.w,
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "10",
                                    style: HelperFunction.textTheme(context)
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 30.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                  Text(
                                    "History",
                                    style: HelperFunction.textTheme(context)
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w700,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: CustomElevatedButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    UpdateProfile.routeName,
                                    arguments: state.data,
                                  );
                                },
                                child: const Text("EditProfile"),
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Expanded(
                              flex: 1,
                              child: CustomElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                    context,
                                    LoginScreen.routeName,
                                  );
                                },
                                buttonStyle: ElevatedButton.styleFrom(
                                  backgroundColor: ThemeColors.red,
                                ),
                                child: SvgPicture.asset(
                                  "assets/icons/exit.svg",
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 33.h,
                      ),
                      DefaultTabController(
                        length: 2,
                        child: TabBar(
                          indicatorColor: ThemeColors.yellow,
                          indicatorSize: TabBarIndicatorSize.tab,
                          dividerColor: Colors.transparent,
                          tabs: [
                            Container(
                              margin: EdgeInsets.only(bottom: 18.h),
                              child: Column(
                                children: [
                                  SvgPicture.asset(
                                      "assets/icons/watchlist.svg"),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "Watch List",
                                    style: HelperFunction.textTheme(context)
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(bottom: 18.h),
                              child: Column(
                                children: [
                                  SvgPicture.asset("assets/icons/folder.svg"),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    "History",
                                    style: HelperFunction.textTheme(context)
                                        .bodyMedium!
                                        .copyWith(
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.w400,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 169.h,
                ),
                Image.asset("assets/images/empty.png"),
              ],
            );
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }
}
