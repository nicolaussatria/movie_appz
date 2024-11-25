import 'package:movie_app/core/utils/api_utils.dart';
import 'package:movie_app/domain/entitites.dart/movie_detail_entity.dart';
import 'package:movie_app/presentation/widgets/movie_detail/movie_detail_appbar.dart';
import 'package:flutter/material.dart';

class MovieDetailBigPoster extends StatelessWidget {
  final MovieDetailEntity movie;

  const MovieDetailBigPoster({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          //color: Colors.red,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: movie.backdropPath == null || movie.backdropPath.isEmpty
                ? Image.network(
                    'https://www.helptechco.com/files/1215BP6.png',
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                    //color: Colors.red,
                  )
                : Image.network(
                    ApiUrls.requestImage(
                      movie.backdropPath,
                    ),
                    height: 300,
                    fit: BoxFit.fitHeight,
                  ),
          ),
        ),
        const Positioned(
          left: 11,
          right: 11,
          top: 55,
          child: MovieDetailAppBar(),
        ),
      ],
    );
  }
}
