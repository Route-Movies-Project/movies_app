import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/Themes/colors.dart';
import 'package:movies_app/core/shared/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomWatchButton extends StatelessWidget {
  const CustomWatchButton({required this.movieDetails, super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
      ),
      child: CustomElevatedButton(
        onPressed: () {
          launchUrl(
            Uri.parse(movieDetails.url),
          );
        },
        buttonStyle: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 55.h),
          backgroundColor: ThemeColors.red,
          foregroundColor: ThemeColors.white,
        ),
        child: const Text('Watch'),
      ),
    );
  }
}
