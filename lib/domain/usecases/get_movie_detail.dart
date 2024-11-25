import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/movie_detail_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetMovieDetailUsecase
    implements MovieDetailUseCase<MovieDetailEntity, int> {
  final IMovieRepository repository;

  GetMovieDetailUsecase(this.repository);

  @override
  Future<Either<Failure, MovieDetailEntity>> call(id) async {
    return await repository.getMovieDetail(id);
  }
}
