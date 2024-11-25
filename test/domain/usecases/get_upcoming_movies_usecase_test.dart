import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/movie_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_upcoming_movies_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities_fake/movie_entity_fake.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetUpcomingMoviesUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetUpcomingMoviesUsecase(repository);
  });

  test(
    'should return a list of MovieEntity with page number for pagination from the repository',
    () async {
      // arrange
      const page = 1;
      when(() => repository.getUpcomingMovies(page)).thenAnswer(
        (_) async => const Right(<MovieEntity>[movieEntity]),
      );
      // act
      final result = await usecase(page);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a failure when it doesn\'t  succeed',
    () async {
      // arrange
      const page = 1;
      when(() => repository.getUpcomingMovies(page)).thenAnswer(
        (_) async => Left(InvalidPageFailure('Invalid page')),
      );
      // act
      final result = await usecase(page);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
