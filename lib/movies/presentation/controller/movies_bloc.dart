import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/core/utils/service_locator.dart';

import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  MoviesBloc(  {required this.getNowPlayingUsecase}) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
                  print("haaaash code0:${sl<GetNowPlayingUsecase>().hashCode}");

      // BaseMoviesRemoteDataSource baseMoviesRemoteDataSource =
      //     MoviesRemoteDataSource();
      // BaseMoviesRepository baseMoviesRepository = MoviesRepository(
      //   remoteDataSource: baseMoviesRemoteDataSource,
      // );
      final result = await getNowPlayingUsecase.execute();
      print("Result cubit : ${result}");
      emit(MoviesState(nowPlayingState: RequestState.loaded));
      result.fold(
        (l) => emit(
          MoviesState(
            nowPlayingMessage: l.message,
            nowPlayingState: RequestState.error,
          ),
        ),
        (r) => emit(
          MoviesState(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
