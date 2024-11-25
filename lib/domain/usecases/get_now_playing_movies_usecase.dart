import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetNowPlayingMoviesUsecase implements UseCase<MovieEntity, int> {
  final IMovieRepository repository;

  GetNowPlayingMoviesUsecase(this.repository);

  @override
  Future<Either<Failure, List<MovieEntity>>> call(int page) async {
    if (page <= 0) {
      return Left(InvalidPageFailure('Invalid page'));
    }
    return await repository.getNowPlayingMovies(page);
  }
}
