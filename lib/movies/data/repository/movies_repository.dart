import 'dart:nativewrappers/_internal/vm/bin/vmservice_io.dart';

import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exception.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';

class MoviesRepository extends BaseMoviesRepository {
  final BaseMoviesRemoteDataSource remoteDataSource;
  MoviesRepository({required this.remoteDataSource});
  @override
  Future<Either<Failure, List<Movies>>> getNowPlaying() async {
    final result = await remoteDataSource.GetNowPlayingMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getPopular() async {
    final result = await remoteDataSource.GetPopularMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, List<Movies>>> getTopRated() async {
    final result = await remoteDataSource.GetTopRatedMovies();
    try {
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.statusMessage));
    }
  }
}
