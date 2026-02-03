import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

abstract class BaseMoviesRepository {
  // ignore: avoid_types_as_parameter_names
  Future<Either<Failure, List<Movies>>> getNowPlaying();
  Future<Either<Failure, List<Movies>>> getPopular();
  Future<Either<Failure, List<Movies>>> getTopRated();
}
