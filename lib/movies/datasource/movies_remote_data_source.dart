import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/core/utils/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> getNowPlayingMovies();
  Future<List<MoviesModel>> getPopularMovies();
  Future<List<MoviesModel>> getTopRatedMovies();
}

class MoviesRemoteDataSource implements BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> getNowPlayingMovies() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      final results = response.data["results"] as List;
      // print("====Result${results}");
      return results.map((item) => MoviesModel.fromJson(item)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getPopularMovies() async {
    final response = await Dio().get(AppConstance.popularMoviesPath);
    if (response.statusCode == 200) {
      final results = response.data["results"] as List;

      return results.map((item) => MoviesModel.fromJson(item)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<MoviesModel>> getTopRatedMovies() async {
    final response = await Dio().get(AppConstance.topRatedMoviesPath);
    if (response.statusCode == 200) {
      final results = response.data["results"] as List;

      return results.map((item) => MoviesModel.fromJson(item)).toList();
    } else {
      throw ServerException(
        errorMessageModel: ErrorMessageModel.fromJson(response.data),
      );
    }
  }
}
