import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
import 'package:movies_app/core/utils/constants/images.dart';
import 'package:movies_app/features/home/data/model/movie_response.dart';
import 'package:movies_app/features/home/presentation/widgets/custom_card.dart';
import 'package:movies_app/features/movie_detials/presentation/views/movie_details_screen.dart';
import 'package:movies_app/features/search/cubit/search_cubit.dart';
import 'package:movies_app/features/search/cubit/search_states.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
              child: SizedBox(
                width: 398.w,
                height: 55.h,
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      context.read<SearchCubit>().searchMovies(value.trim());
                    } else {
                      context.read<SearchCubit>().resetSearchResults();
                    }
                  },
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 12.0.w, vertical: 8.h),
                      child: SvgPicture.asset(
                        AppAssets.searchTap,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    hintText: 'Search',
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 32.sp,
                        ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<SearchCubit, SearchMoviesStates>(
              builder: (context, state) {
                if (state is SearchMoviesLoading) {
                  return const LoadingIndicator();
                } else if (state is SearchMoviesError) {
                  return ErrorWidget(state.errorMessage);
                } else if (state is SearchMoviesSuccess) {
                  List<Movie> movies = state.movies;
                  if (_searchController.text.isEmpty || movies.isEmpty) {
                    return Container(
                      height: 750.h, // Fixed height constraint
                      alignment: Alignment.center,
                      child: Text(
                        'No Movies Found',
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    );
                  }

                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),
                    child: GridView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: movies.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 20.w,
                        childAspectRatio: 189.w / 279.h,
                      ),
                      itemBuilder: (context, index) {
                        return CustomCard(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              MovieDetailsScreen.routeName,
                              arguments: movies[index],
                            );
                          },
                          customWidth: 189.w,
                          customHeight: 279.h,
                          movie: movies[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox.shrink(
                    child: Text('No Movies Found'),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
