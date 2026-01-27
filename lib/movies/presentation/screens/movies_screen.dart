import 'package:flutter/material.dart';
import 'package:movies_app/movies/data/repository/movies_repository.dart';
import 'package:movies_app/movies/datasource/movies_remote_data_source.dart';
import 'package:movies_app/movies/domain/repository/base_movies_repositor.dart';
import 'package:movies_app/movies/domain/usecase/get_now_playing_usecase.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({super.key});

  @override
  State<MoviesScreen> createState() => _MoviesScreenState();
}

class _MoviesScreenState extends State<MoviesScreen> {
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final BaseMoviesRemoteDataSource movieRemoteDataSource =
        MoviesRemoteDataSource();
    final BaseMoviesRepository baseMoviesRepository = MoviesRepository(
      remoteDataSource: movieRemoteDataSource,
    );
    final result = await GetNowPlayingUsecase(
      baseMoviesRepository: baseMoviesRepository,
    ).execute();
    print("Result is $result");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(child: Text("Movies Screen")),
    );
  }
}
