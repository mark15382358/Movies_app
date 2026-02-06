import 'package:equatable/equatable.dart';

class Recommended extends Equatable {
  final int id;
  final String? backdropPath;
  const Recommended({required this.backdropPath, required this.id});

  @override
  List<Object?> get props => [id, backdropPath];
}
