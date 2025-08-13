import 'package:either_dart/either.dart';
import 'package:find_movies/core/errors/failure.dart';
import 'package:find_movies/features/movies/domain/entities/movie.dart';
import 'package:find_movies/features/movies/domain/repositories/movie_repository.dart';

import '../../../../core/usecases/usecase.dart';



class GetTrendingSeries implements UseCase<List<Movie>, NoParams> {
  final IMovieRepository repository;

  GetTrendingSeries(this.repository);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParams params) async {
    return await repository.getTrendingSeries();
  }
}