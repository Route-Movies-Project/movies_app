import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/service/service_locator.dart';
import 'package:movies_app/core/shared/widgets/default_text_field.dart';
import 'package:movies_app/core/shared/widgets/loading_indicator.dart';
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
  final _scrollController = ScrollController();
  final searchCubit = getIt<SearchCubit>();
  String query = "";
  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) {
        _scrollController.addListener(
          () {
            if (_scrollController.position.pixels >=
                _scrollController.position.maxScrollExtent - 200) {
              context.read<SearchCubit>().searchMovies(
                    query.trim(),
                    20,
                    isPagination: true,
                  );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 26.h),
            child: SizedBox(
              width: 398.w,
              height: 55.h,
              child: DefaultTextFormField(
                hintText: "Search",
                prefixImageName: "search",
                textEditingController: _searchController,
                onChanged: (value) {
                  query = value;
                  if (query.isNotEmpty) {
                    context.read<SearchCubit>().searchMovies(query.trim(), 20);
                  } else {
                    context.read<SearchCubit>().resetSearchResults();
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchMoviesStates>(
              builder: (context, state) {
                if (state is SearchMoviesLoading) {
                  return const LoadingIndicator();
                } else if (state is SearchMoviesError) {
                  return ErrorWidget(state.errorMessage);
                } else if (state is SearchMoviesSuccess) {
                  if (_searchController.text.isEmpty || state.movies.isEmpty) {
                    return Container(
                      height: 750.h,
                      alignment: Alignment.center,
                      child: Image.asset("assets/images/empty.png"),
                    );
                  }
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: GridView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.only(bottom: 115.h),
                      shrinkWrap: true,
                      itemCount: state.movies.length +
                          (searchCubit.hasMoreData ? 2 : 0),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16.h,
                        crossAxisSpacing: 20.w,
                        childAspectRatio: 189.w / 279.h,
                      ),
                      itemBuilder: (context, index) {
                        if (index >= state.movies.length) {
                          return const LoadingIndicator();
                        } else {
                          return CustomCard(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                MovieDetailsScreen.routeName,
                                arguments: state.movies[index].id,
                              );
                            },
                            customWidth: 189.w,
                            customHeight: 279.h,
                            movie: state.movies[index],
                          );
                        }
                      },
                    ),
                  );
                } else {
                  return Container(
                    height: 750.h,
                    alignment: Alignment.center,
                    child: Image.asset("assets/images/empty.png"),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
