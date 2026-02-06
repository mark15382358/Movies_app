import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

class GetTopRatedMoviesUsecases extends BaseUsecase<List<Movies>,NoParameters> {
  BaseMoviesRepository baseMoviesRepository;
  GetTopRatedMoviesUsecases({required this.baseMoviesRepository});
  
  @override
  Future<Either<Failure, List<Movies>>> call(NoParameters params)async {
return await baseMoviesRepository.getTopRated();    
  }
 
}
