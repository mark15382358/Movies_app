import 'package:movies_app/movies/domain/entities/recommended.dart';

class RecommendedModel extends Recommended {
  const RecommendedModel({required super.backdropPath, required super.id});
  factory RecommendedModel.fromJson(Map<String, dynamic> json) =>
      RecommendedModel(
        backdropPath:
            json['backdrop_path'] ?? "/rbUHgt0B9ti5MDJ26u3AtndZfA6.jpg",
        id: json['id']??1168190,
      );
}
