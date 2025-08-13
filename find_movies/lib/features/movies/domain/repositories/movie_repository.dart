import 'package:either_dart/either.dart';
import 'package:find_movies/features/movies/domain/entities/movie.dart';

import '../../../../core/errors/failure.dart';

abstract class IMovieRepository {
  Future<Either<Failure, List<Movie>>> getTrendingMovies();
  Future<Either<Failure, List<Movie>>> getTrendingSeries();
}
