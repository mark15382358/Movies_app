part of 'movies_details_bloc.dart';

class MoviesDetailsState extends Equatable {
  final MoviesDetails? moviesDetails;
  final RequestState moviesDetailsState;
  final String moviesDetailsMessage;
  final List<Recommended> recommendedMovies;
  final RequestState recommendedMoviesState;
  final String recommendedMoviesMesssage;
  const MoviesDetailsState({
    this.recommendedMovies = const [],
    this.recommendedMoviesState = RequestState.loading,
    this.recommendedMoviesMesssage = '',
    this.moviesDetails,
    this.moviesDetailsState = RequestState.loading,
    this.moviesDetailsMessage = '',
  });

  @override
  List<Object?> get props => [
    moviesDetails,
    moviesDetailsState,
    moviesDetailsMessage,
    recommendedMovies,
    recommendedMoviesState,
    recommendedMoviesMesssage,
  ];

  MoviesDetailsState copyWith({
    final MoviesDetails? moviesDetails,
    final RequestState? moviesDetailsState,
    final String? moviesDetailsMessage,
    final RequestState? recommendedMoviesState,
    List<Recommended>? recommendedMovies,
    final String? recommendedMoviesMesssage,
  }) {
    return MoviesDetailsState(
      moviesDetails: moviesDetails ?? this.moviesDetails,
      moviesDetailsState: moviesDetailsState ?? this.moviesDetailsState,
      moviesDetailsMessage: moviesDetailsMessage ?? this.moviesDetailsMessage,
      recommendedMovies: recommendedMovies ?? this.recommendedMovies,
      recommendedMoviesState:
          recommendedMoviesState ?? this.recommendedMoviesState,
      recommendedMoviesMesssage:
          recommendedMoviesMesssage ?? this.recommendedMoviesMesssage,
    );
  }
}
