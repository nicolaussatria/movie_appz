import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/cast_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetCastUsecase implements UseCase<CastEntity, int> {
  final IMovieRepository repository;

  GetCastUsecase(this.repository);

  @override
  Future<Either<Failure, List<CastEntity>>> call(id) async {
    return await repository.getCastCrew(id);
  }
}
