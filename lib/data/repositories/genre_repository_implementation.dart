import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/data/datasources/genre_remote_datasource.dart';
import 'package:movie_app/data/models/genre_model.dart';
import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/repositories/genre_repository.dart';
import 'package:dartz/dartz.dart';

class GenreRepositoryImplementation extends IGenreRepository {
  final IGenreRemoteDataSource remoteDataSource;

  GenreRepositoryImplementation(this.remoteDataSource);

  @override
  Future<Either<Failure, List<Genre>>> getAllGenres() async {
    try {
      final allGenres = await remoteDataSource.getAllGenres();
      return Right(allGenres.genres);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
