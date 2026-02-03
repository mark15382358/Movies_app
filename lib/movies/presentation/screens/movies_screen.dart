import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_bloc.dart';
import 'package:movies_app/movies/presentation/controller/movies_event.dart';
import 'package:movies_app/movies/presentation/controller/movies_state.dart';

class MoviesScreen extends StatelessWidget {
  const MoviesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MoviesBloc()..add(GetNowPlayingMoviesEvent()),
      lazy: false,
      child: Scaffold(
        backgroundColor: Colors.amber,
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            print("State sceeeen :${state}");
            return const Center(child: Text("Movies Screen"));
          },
        ),
      ),
    );
  }
}
