import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';
import 'package:movies_app/movies/domain/entities/recommended.dart';
import 'package:movies_app/movies/domain/usecase/get_recommended_usecase.dart';
import 'package:movies_app/movies/domain/usecase/movies_details_usecase.dart';
part 'movies_details_event.dart';
part 'movies_details_state.dart';

class MoviesDetailsBloc extends Bloc<MoviesDetailsEvent, MoviesDetailsState> {
  final MoviesDetailsUsecase moviesDetailsUsecase;
  final GetRecommendedUsecase getRecommendedUsecase;
  MoviesDetailsBloc(this.moviesDetailsUsecase, this.getRecommendedUsecase)
    : super(MoviesDetailsState()) {
    on<GetMovieDetailsEvent>((event, emit) async {
      await getMoviesDetails(event, emit);
    });
    on<GetMoviesRecommendedEvent>((event, emit) async {
      await getRecommended(event, emit);
    });
  }

  Future<void> getMoviesDetails(
    GetMovieDetailsEvent event,
    Emitter emit,
  ) async {
    final result = await moviesDetailsUsecase(
      MoviesDeatailsParameters(id: event.id),
    );

    result.fold(
      (l) => emit(
        state.copyWith(
          moviesDetailsMessage: l.message,
          moviesDetailsState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          moviesDetails: r,
          moviesDetailsState: RequestState.loaded,
        ),
      ),
    );
  }

  Future<void> getRecommended(
    GetMoviesRecommendedEvent event,
    Emitter emit,
  ) async {
    final result = await getRecommendedUsecase(
      GetRecommendedParameters(id: event.id),
    );
    print("result recommmmended$result");

    result.fold(
      (l) => emit(
        state.copyWith(
          recommendedMoviesMesssage: l.message,
          recommendedMoviesState: RequestState.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendedMovies: r,
          recommendedMoviesState: RequestState.loaded,
        ),
      ),
    );
  }
}
