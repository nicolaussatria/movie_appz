import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class SearchMoviesUsecase implements UseCase<MovieEntity, String> {
  final IMovieRepository repository;

  SearchMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(String searchText) async {
    return await repository.getSearchedMovies(searchText);
  }
}
