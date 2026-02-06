part of 'movies_details_bloc.dart';

sealed class MoviesDetailsEvent extends Equatable {
  const MoviesDetailsEvent();

  @override
  List<Object> get props => [];
}

class GetMovieDetailsEvent extends MoviesDetailsEvent {
  final int id;
  const GetMovieDetailsEvent({required this.id});
  @override
  List<Object> get props => [id];
}

class GetMoviesRecommendedEvent extends MoviesDetailsEvent {
  final int id;
  const GetMoviesRecommendedEvent({required this.id});
  @override
  List<Object> get props => [id];
}
