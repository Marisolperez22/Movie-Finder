import 'package:either_dart/either.dart';

import 'package:find_movies/core/errors/failure.dart';
import 'package:find_movies/features/movies/data/models/movie_model.dart';

import 'package:find_movies/features/movies/domain/entities/movie.dart';

import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_datasource.dart';

class MovieRepositoryImpl implements IMovieRepository {
  final IMovieDatasource datasource;

  MovieRepositoryImpl(this.datasource);

  @override
  Future<Either<Failure, List<Movie>>> getTrendingMovies() async {
    try {
      final movies = await datasource.getTrendingMovies();
      final moviesConverted = movies.map((model) => model.toEntity()).toList();
      return Right(moviesConverted);
    } catch (e) {
      return Left(ServerFailure(400));
    }
  }
  
  @override
  Future<Either<Failure, List<Movie>>> getTrendingSeries() async {
    try {
      final series = await datasource.getTrendingSeries();
      final seriesConverted = series.map((model) => model.toEntity()).toList();
      return Right(seriesConverted);
    } catch (e) {
      return Left(ServerFailure(400));
    }
  }
}
