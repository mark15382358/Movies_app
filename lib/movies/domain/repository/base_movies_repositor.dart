import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/data/models/recommended_model.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/entities/recommended.dart';
import 'package:movies_app/movies/domain/usecase/get_recommended_usecase.dart';
import 'package:movies_app/movies/domain/usecase/movies_details_usecase.dart';

abstract class BaseMoviesRepository {
  // ignore: avoid_types_as_parameter_names
  Future<Either<Failure, List<Movies>>> getNowPlaying();
  Future<Either<Failure, List<Movies>>> getPopular();
  Future<Either<Failure, List<Movies>>> getTopRated();
  Future<Either<Failure, MoviesDetails>> getMoviesDetails(
    MoviesDeatailsParameters parameters,
  );
  Future<Either<Failure, List <Recommended>>> getRecommended(
    GetRecommendedParameters parameters,
  );
}
