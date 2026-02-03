import 'package:get_it/get_it.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';

final sl = GetIt.instance;

class ServiceLocator {
  void init() {
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
  }
}
