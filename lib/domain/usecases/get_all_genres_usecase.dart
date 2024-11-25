import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/genre_entity.dart';
import 'package:movie_app/domain/repositories/genre_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetAllGenresUsecase implements UseCase<GenreEntity, NoParams> {
  final IGenreRepository repository;

  GetAllGenresUsecase(this.repository);

  @override
  Future<Either<Failure, List<GenreEntity>>> call(NoParams noParams) async {
    return await repository.getAllGenres();
  }
}
