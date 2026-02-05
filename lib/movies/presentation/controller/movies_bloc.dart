import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
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
      await getNowPlayingMoviesEvent(event, emit);
    });
    on<GetPopularMoviesEvent>((event, emit) async {
      await getPopularMoviesEvent(event, emit);
    });
    on<GetTopRatedMoviesEvent>((event, emit) async {
      await getTopRatedMovies(event, emit);
    });
  }

  Future<void> getNowPlayingMoviesEvent(
    GetNowPlayingMoviesEvent event,
    Emitter<MoviesState> emit,
  ) async {
    final result = await getNowPlayingUsecase();

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
  }

  Future<void> getPopularMoviesEvent(
    GetPopularMoviesEvent event,
    Emitter emit,
  ) async {
    final result = await getPopularMoviesUsecase.call();

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
  }

  Future<void> getTopRatedMovies(
    GetTopRatedMoviesEvent event,
    Emitter emit,
  ) async {
    final result = await getTopRatedMoviesUsecases.call();
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
  }
}
