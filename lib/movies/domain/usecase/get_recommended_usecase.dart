import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movies/domain/entities/recommended.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';

class GetRecommendedUsecase
    extends BaseUsecase<List<Recommended>, GetRecommendedParameters> {
  final BaseMoviesRepository moviesRepository;
  GetRecommendedUsecase({required this.moviesRepository});
  @override
  Future<Either<Failure, List<Recommended>>> call(parameters) async {
    return await moviesRepository.getRecommended(parameters);
  }
}

class GetRecommendedParameters extends Equatable {
  final int id;
  const GetRecommendedParameters({required this.id});
  @override
  List<Object?> get props => [id];
}
