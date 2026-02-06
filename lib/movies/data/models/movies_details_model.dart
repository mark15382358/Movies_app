import 'package:movies_app/movies/data/models/geners_model.dart';
import 'package:movies_app/movies/domain/entities/movies_details.dart';

class MoviesDetailsModel extends MoviesDetails {
  const MoviesDetailsModel({
    required super.runtime,
    required super.geners,
    required super.backdropPath,
    required super.id,
    required super.originaltitle,
    required super.overview,
    required super.releasedate,
    required super.voteaverage,
  });
  factory MoviesDetailsModel.fromJson(Map<String, dynamic> json) =>
      MoviesDetailsModel(
        runtime: json['runtime'],
        geners: List<GenersModel>.from(
          json["genres"].map((x) => GenersModel.fromJson(x)),
        ),
        backdropPath: json['backdrop_path'],

        id: json['id'],

        originaltitle: json['original_title'],

        overview: json['overview'],

        releasedate: json['release_date'],
        voteaverage: json['vote_average'],
      );
}
