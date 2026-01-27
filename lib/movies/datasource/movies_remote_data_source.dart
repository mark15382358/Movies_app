import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/utils/constant.dart';
import 'package:movies_app/core/utils/network/error_message_model.dart';
import 'package:movies_app/movies/data/models/movies_model.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';

abstract class BaseMoviesRemoteDataSource {
  Future<List<MoviesModel>> GetNowPlayingMovies();
  Future<List<MoviesModel>> GetPopularMovies();
  Future<List<MoviesModel>> GetTopRatedMovies();
}

class MoviesRemoteDataSource implements BaseMoviesRemoteDataSource {
  @override
  Future<List<MoviesModel>> GetNowPlayingMovies() async {
    final response = await Dio().get(AppConstance.nowPlayingMoviesPath);
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
  Future<List<MoviesModel>> GetPopularMovies() async {
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
  Future<List<MoviesModel>> GetTopRatedMovies() async {
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
