import 'package:movie_app/core/error/exceptions.dart';
import 'package:movie_app/core/http_client/http_client.dart';
import 'package:movie_app/core/utils/api_utils.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/data/models/genre_list_model.dart';

abstract class IGenreRemoteDataSource {
  Future<GenreModel> getAllGenres();
}

class GenreRemoteDatasourceImplementation extends IGenreRemoteDataSource {
  final HttpClient client;

  GenreRemoteDatasourceImplementation(this.client);

  @override
  Future<GenreModel> getAllGenres() async {
    Response response = await client.get(ApiUrls.movieGenres());
    final genresList = GenreModel.fromMap(response.data);
    if (response.statusCode == 200) {
      return genresList;
    } else {
      throw const ServerException('Something went wrong!');
    }
  }
}
