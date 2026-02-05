import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

class GetPopularMoviesUsecase extends BaseUsecase<List<Movies>> {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUsecase({required this.baseMoviesRepository});

  @override
  Future<Either<Failure, List<Movies>>> call() async {
    return await baseMoviesRepository.getPopular();
  }
}
