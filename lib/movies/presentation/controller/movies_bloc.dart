import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/core/utils/service_locator.dart';

import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_popular_movies_usecase.dart';
import 'package:movies_app/movies/domain/usecase/get_top_rated_movies_usecases.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final GetNowPlayingUsecase getNowPlayingUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;
  final GetTopRatedMoviesUsecases getTopRatedMoviesUsecases;

  MoviesBloc({
    required this.getNowPlayingUsecase,
    required this.getPopularMoviesUsecase,
    required this.getTopRatedMoviesUsecases,
  }) : super(MoviesState()) {
    on<GetNowPlayingMoviesEvent>((event, emit) async {
      // print("haaaash code0:${sl<GetNowPlayingUsecase>().hashCode}");

      final result = await getNowPlayingUsecase.execute();
      // print("Result cubit : ${result}");
      emit(state.copyWith(nowPlayingState: RequestState.loaded));
      result.fold(
        (l) => emit(
          state.copyWith(
            nowPlayingMessage: l.message,
            nowPlayingState: RequestState.error,
          ),
        ),
        (r) => emit(
          state.copyWith(
            nowPlayingMovies: r,
            nowPlayingState: RequestState.loaded,
          ),
        ),
      );
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      final result = await getPopularMoviesUsecase.execute();
      emit(state.copyWith(popularMoviesState: RequestState.loaded));

      result.fold(
        (l) => emit(
          state.copyWith(
            popularMoviesMessage: l.message,
            popularMoviesState: RequestState.error,
          ),
        ),
        (r) => emit(
          state.copyWith(
            popularMovies: r,
            popularMoviesState: RequestState.loaded,
          ),
        ),
      );
      print("popularrrrrrrrr result:${result}");
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      final result = await getTopRatedMoviesUsecases.execute();
      emit(state.copyWith(topRatedMoviesState: RequestState.loaded));
      result.fold(
        (l) => emit(
          state.copyWith(
            topRatedMoviesMessage: l.message,
            topRatedMoviesState: RequestState.error,
          ),
        ),
        (r) => emit(
          state.copyWith(
            topRatedMovies: r,
            topRatedMoviesState: RequestState.loaded,
          ),
        ),
      );
    });
  }
}
