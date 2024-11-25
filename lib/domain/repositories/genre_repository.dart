import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/genre_entity.dart';
import 'package:dartz/dartz.dart';

abstract class IGenreRepository {
  Future<Either<Failure, List<GenreEntity>>> getAllGenres();
}
