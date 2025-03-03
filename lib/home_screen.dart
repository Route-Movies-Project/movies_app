import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/features/home/homt_tab.dart';
import 'package:movies_app/features/profile/presentation/view/profile.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _screens = [
    HomeTab(),
    HomeTab(),
    HomeTab(),
    Profile(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      _screens[_selectedIndex],
      Positioned(
        left: 16.h,
        right: 16.h,
        bottom: 16.h,
        child: Container(
          height: 92.h,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(16.r),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.homeTap,
                    width: 26.w,
                    height: 23.h,
                    colorFilter: ColorFilter.mode(
                      _selectedIndex == 0
                          ? ThemeColors.yellow
                          : ThemeColors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.searchTap,
                    width: 26.w,
                    height: 23.h,
                    color: _selectedIndex == 1
                        ? ThemeColors.yellow
                        : ThemeColors.white,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.exploreTap,
                    width: 26.w,
                    height: 23.h,
                    color: _selectedIndex == 2
                        ? ThemeColors.yellow
                        : ThemeColors.white,
                  ),
                  label: 'Browse',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppAssets.profileTap,
                    width: 26.w,
                    height: 23.h,
                    color: _selectedIndex == 3
                        ? ThemeColors.yellow
                        : ThemeColors.white,
                  ),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ),
      )
    ]));
  }
}
