import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

class GetPopularMoviesUsecase {
  final BaseMoviesRepository baseMoviesRepository;
  GetPopularMoviesUsecase({required this.baseMoviesRepository});
 Future<Either<Failure,List<Movies>>>  execute() async {
    return await baseMoviesRepository.getPopular();
  }
}
