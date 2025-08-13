import 'package:find_movies/features/movies/data/datasources/movie_datasource.dart';
import 'package:find_movies/features/movies/domain/usecases/get_trending_series.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

import 'features/movies/data/repositories/movie_repository_impl.dart';
import 'features/movies/domain/repositories/movie_repository.dart';
import 'features/movies/domain/usecases/get_trending_movies.dart';
import 'features/movies/presentation/bloc/movie_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc - Usa registerFactory para crear nueva instancia cada vez
  sl.registerFactory(() => MovieBloc(getTrendingMovies: sl(), getTrendingSeries: sl()));

  // Use cases - LazySingleton para una sola instancia
  sl.registerLazySingleton(() => GetTrendingMovies(sl()));
  sl.registerLazySingleton(() => GetTrendingSeries(sl()));


  // Repository - Implementación concreta
  sl.registerLazySingleton<IMovieRepository>(() => MovieRepositoryImpl(sl()));

  // Añade estas dependencias adicionales que faltan:

  // DataSource
  sl.registerLazySingleton<IMovieDatasource>(() => MovieDatasource());

  // HTTP Client
  sl.registerLazySingleton(() => http.Client());
}
