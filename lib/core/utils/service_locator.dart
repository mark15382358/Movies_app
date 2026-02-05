import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
    ///movies Bloc
    sl.registerFactory(
      () => MoviesBloc(
        getNowPlayingUsecase: sl(),
        getPopularMoviesUsecase: sl(),
        getTopRatedMoviesUsecases: sl(),
      ),
    );

    ///Remote datasource
    sl.registerLazySingleton<BaseMoviesRemoteDataSource>(
      () => MoviesRemoteDataSource(),
    );

    /// movies repository
    sl.registerLazySingleton<BaseMoviesRepository>(
      () => MoviesRepository(remoteDataSource: sl()),
    );

    ///use case
    sl.registerLazySingleton<GetNowPlayingUsecase>(
      () => GetNowPlayingUsecase(baseMoviesRepository: sl()),
    );
    sl.registerLazySingleton<GetPopularMoviesUsecase>(
      () => GetPopularMoviesUsecase(baseMoviesRepository: sl()),
    );
    sl.registerLazySingleton<GetTopRatedMoviesUsecases>(
      () => GetTopRatedMoviesUsecases(baseMoviesRepository: sl()),
    );
  }
}
