import 'package:movie_app/core/error/failure.dart';
import 'package:movie_app/domain/entitites.dart/video_entity.dart';
import 'package:movie_app/domain/repositories/movie_repository.dart';
import 'package:movie_app/domain/usecases/usecase.dart';
import 'package:dartz/dartz.dart';

class GetVideosUsecase implements UseCase<VideoEntity, int> {
  final IMovieRepository repository;

  GetVideosUsecase(this.repository);

  @override
  Future<Either<Failure, List<VideoEntity>>> call(id) async {
    return await repository.getVideos(id);
  }
}
