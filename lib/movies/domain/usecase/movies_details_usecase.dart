import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';

class MoviesDetailsUsecase
    extends BaseUsecase<MoviesDetails, MoviesDeatailsParameters> {
  BaseMoviesRepository baseMoviesRepository;
  MoviesDetailsUsecase({required this.baseMoviesRepository});
  @override
  Future<Either<Failure, MoviesDetails>> call(
    MoviesDeatailsParameters moviesDetailsParameters,
  ) async {
    return await baseMoviesRepository.getMoviesDetails(moviesDetailsParameters);
  }
}

class MoviesDeatailsParameters extends Equatable {
  final int id;
  const MoviesDeatailsParameters({required this.id});
  @override
  List<Object?> get props => [id];
}
