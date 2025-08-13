import 'package:dio/dio.dart';

import '../../../../config/constants/environment.dart';
import '../models/movie_model.dart';

abstract class IMovieDatasource {
  Future<List<MovieModel>> getTrendingMovies();
  Future<List<MovieModel>> getTrendingSeries();
}

class MovieDatasource implements IMovieDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key': Environment.theMovieDbKey,
        'language': 'es-MX',
      },
    ),
  );

  @override
  Future<List<MovieModel>> getTrendingMovies() async {
    final response = await dio.get('/trending/movie/day');

    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List)
        .map((json) => MovieModel.fromJson(json))
        .toList();
  }
  
  @override
  Future<List<MovieModel>> getTrendingSeries() async {
    final response = await dio.get('/trending/tv/day');

    final data = response.data as Map<String, dynamic>;
    return (data['results'] as List)
        .map((json) => MovieModel.fromJson(json))
        .toList();
  }
}
