import 'package:equatable/equatable.dart';
import 'package:movies_app/movies/domain/entities/geners.dart';

class MoviesDetails extends Equatable {
  final String backdropPath;
  final int id;
  final int runtime;
  final List<Geners> geners;
  final String overview;
  final String releasedate;
  final String originaltitle;
  final double voteaverage;
  const MoviesDetails({
    required this.runtime,
    required this.geners,
    required this.backdropPath,
    required this.id,
    required this.originaltitle,
    required this.overview,
    required this.releasedate,
    required this.voteaverage,
  });

  @override
  List<Object?> get props => [
    voteaverage,
    releasedate,
    overview,
    originaltitle,
    id,
    backdropPath,
  ];
}
