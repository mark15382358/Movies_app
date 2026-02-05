import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movies/domain/entities/movies.dart';

class MoviesState extends Equatable {
  @override
  List<Object?> get props => [
    nowPlayingMovies,
    nowPlayingState,
    nowPlayingMessage,
    popularMovies,
    popularMoviesState,
    popularMoviesMessage,
    topRatedMovies,
    topRatedMoviesMessage,
    topRatedMoviesState,
  ];

  final List<Movies> nowPlayingMovies;
  final RequestState nowPlayingState;
  final String nowPlayingMessage;
  final List<Movies> popularMovies;
  final RequestState popularMoviesState;
  final String popularMoviesMessage;
  final List<Movies> topRatedMovies;
  final RequestState topRatedMoviesState;
  final String topRatedMoviesMessage;
  const MoviesState({
    this.nowPlayingMovies = const [],
    this.nowPlayingState = RequestState.loading,
    this.nowPlayingMessage = '',
    this.popularMovies = const [],
    this.popularMoviesMessage = '',
    this.popularMoviesState = RequestState.loading,
    this.topRatedMovies = const [],
    this.topRatedMoviesMessage = '',
    this.topRatedMoviesState = RequestState.loading,
  });


    MoviesState copyWith({
    List<Movies>? nowPlayingMovies,
    RequestState? nowPlayingState,
    String? nowPlayingMessage,
    List<Movies>? popularMovies,
    RequestState? popularMoviesState,
    String? popularMoviesMessage,
    List<Movies>? topRatedMovies,
    RequestState? topRatedMoviesState,
    String? topRatedMoviesMessage,
  }) {
    return MoviesState(
      nowPlayingMovies: nowPlayingMovies ?? this.nowPlayingMovies,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      popularMovies: popularMovies ?? this.popularMovies,
      popularMoviesState: popularMoviesState ?? this.popularMoviesState,
      popularMoviesMessage: popularMoviesMessage ?? this.popularMoviesMessage,
      topRatedMovies: topRatedMovies ?? this.topRatedMovies,
      topRatedMoviesState: topRatedMoviesState ?? this.topRatedMoviesState,
      topRatedMoviesMessage: topRatedMoviesMessage ?? this.topRatedMoviesMessage,
    );
  }
  
}


