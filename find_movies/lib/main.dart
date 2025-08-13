import 'package:find_movies/features/movies/domain/usecases/get_trending_series.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'config/router/app_router.dart';
import 'features/movies/domain/usecases/get_trending_movies.dart';
import 'features/movies/presentation/bloc/movie_bloc.dart';
import 'injection_container.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  await init(); 

  runApp(MultiBlocProvider(
    providers: [
       BlocProvider<MovieBloc>(
          create: (context) => MovieBloc(
            getTrendingMovies: sl<GetTrendingMovies>(),
            getTrendingSeries: sl<GetTrendingSeries>(),
          ),
        ),
    ],
    child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp.router(
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
      // theme: AppTheme().getTheme(),
    );
  }
}
