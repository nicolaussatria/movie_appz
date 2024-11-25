import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/presentation/widgets/movie_detail/movie_detail_arguments.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class MovieCardWidget extends StatelessWidget {
  final int movieId;
  final String? posterPath;
  final String? title;
  const MovieCardWidget({
    super.key,
    required this.movieId,
    this.posterPath,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Modular.to
            .pushNamed('./detail', arguments: MovieDetailArguments(movieId));
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(11),
        // ignore: unnecessary_null_comparison
        child: posterPath == null || posterPath!.isEmpty
            ? Image.network(
                'https://www.helptechco.com/files/1215BP6.png',
                fit: BoxFit.cover,
              )
            : Image.network(
                ApiUrls.requestImage(
                  posterPath!,
                ),
                fit: BoxFit.cover,
              ),
      ),
    );
  }
}
