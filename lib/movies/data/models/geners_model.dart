import 'package:movies_app/movies/domain/entities/geners.dart';

class GenersModel extends Geners {
  const GenersModel({required super.id, required super.name});
  factory GenersModel.fromJson(Map<String, dynamic> json) =>
      GenersModel(id: json['id'], name: json['name']);
}
