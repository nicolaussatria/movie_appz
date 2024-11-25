import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/video_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/get_videos_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../entities_fake/video_entity_fake.dart';

class MockMovieRepository extends Mock implements IMovieRepository {}

void main() {
  late GetVideosUsecase usecase;
  late IMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    usecase = GetVideosUsecase(repository);
  });

  const id = 1;

  test(
    'should return a list of of VideoEntity when succeed',
    () async {
      // arrange

      when(() => repository.getVideos(id)).thenAnswer(
        (_) async => const Right(<VideoEntity>[videoEntity]),
      );
      // act
      final result = await usecase(id);
      // assert
      expect(result.isRight(), true);
    },
  );

  test(
    'should return a Failure when it doesn\'t succeed',
    () async {
      // arrange
      when(() => repository.getVideos(id)).thenAnswer(
        (_) async => Left(ServerFailure()),
      );
      // act
      final result = await usecase(id);
      // assert
      expect(result.isLeft(), true);
    },
  );
}
