import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';

abstract class MoviesEvent extends Equatable {
  MoviesEvent();
  @override
  List<Object?> get props => [];
}
class GetNowPlayingMoviesEvent extends MoviesEvent {}
class GetPopularMoviesEvent extends MoviesEvent {}
class GetTopRatedMoviesEvent extends MoviesEvent {}
