import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/features/browse/presentation/view/browse_tab.dart';
import 'package:movies_app/features/home/cubit/movies_cubit.dart';
import 'package:movies_app/features/home/cubit/movies_genre_cubit.dart';
import 'package:movies_app/features/home/presentation/view/home_tab.dart';
import 'package:movies_app/features/profile/presentation/view/profile.dart';
import 'package:movies_app/features/search/cubit/search_cubit.dart';
import 'package:movies_app/features/search/presentation/views/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final moviesCubit = getIt<MoviesCubit>();
  static final List<Widget> _screens = [
    const HomeTab(),
    const SearchTab(),
    const BrowseTab(),
    const Profile(),
  ];
  @override
  void initState() {
    super.initState();
    moviesCubit.getMovies();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => getIt.get<MoviesCubit>()),
          BlocProvider(create: (context) => getIt.get<MoviesGenreCubit>()),
          BlocProvider(create: (context) => getIt.get<SearchCubit>()),
        ],
        child: Stack(
          children: [
            _screens[_selectedIndex],
            Positioned(
              left: 16.h,
              right: 16.h,
              bottom: 16.h,
              child: SizedBox(
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
                          colorFilter: ColorFilter.mode(
                            _selectedIndex == 1
                                ? ThemeColors.yellow
                                : ThemeColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Search',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AppAssets.exploreTap,
                          width: 26.w,
                          height: 23.h,
                          colorFilter: ColorFilter.mode(
                            _selectedIndex == 2
                                ? ThemeColors.yellow
                                : ThemeColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Browse',
                      ),
                      BottomNavigationBarItem(
                        icon: SvgPicture.asset(
                          AppAssets.profileTap,
                          width: 26.w,
                          height: 23.h,
                          colorFilter: ColorFilter.mode(
                            _selectedIndex == 3
                                ? ThemeColors.yellow
                                : ThemeColors.white,
                            BlendMode.srcIn,
                          ),
                        ),
                        label: 'Profile',
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
