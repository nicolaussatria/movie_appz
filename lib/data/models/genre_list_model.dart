import 'package:movie_app/data/models/genre_model.dart';

class GenreModel {
  final List<Genre> genres;

  const GenreModel({required this.genres});

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    List<Genre> genres = [];
    if (map['genres'] != null) {
      genres = List<Genre>.from(
        map['genres'].map(
          (genre) => Genre.fromMap(genre),
        ),
      );
    }
    return GenreModel(genres: genres);
  }
}
