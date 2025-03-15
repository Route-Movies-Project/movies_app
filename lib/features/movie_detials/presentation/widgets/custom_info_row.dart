import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_detials/data/model/movie_details_response.dart';
import 'package:movies_app/features/movie_detials/presentation/widgets/info_card.dart';

class CustomInfoRow extends StatelessWidget {
  const CustomInfoRow({required this.movieDetails, super.key});
  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InfoCard(
          text: movieDetails.torrents.length.toString(),
          icon: Icons.favorite,
        ),
        InfoCard(
          text: movieDetails.runtime.toString(),
          icon: Icons.timelapse,
        ),
        InfoCard(
          text: movieDetails.rating.toString(),
          icon: Icons.star,
        ),
      ],
    );
  }
}
