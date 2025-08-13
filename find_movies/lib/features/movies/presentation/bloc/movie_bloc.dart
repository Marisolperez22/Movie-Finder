import 'package:find_movies/features/movies/domain/usecases/get_trending_series.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../config/widgets/validator_widget.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/movie.dart';
import '../../domain/usecases/get_trending_movies.dart';

part 'movie_state.dart';
part 'movie_event.dart';
part 'movie_bloc.freezed.dart';

@injectable
class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetTrendingMovies _getTrendingMovies;
  final GetTrendingSeries _getTrendingSeries;

  MovieBloc({
    required GetTrendingMovies getTrendingMovies,
    required GetTrendingSeries getTrendingSeries,
  }) : _getTrendingMovies = getTrendingMovies,
       _getTrendingSeries = getTrendingSeries,
       super(MovieState.initial()) {
    on<_FetchTrendingMovies>(_onFetchTrendingMovies);
    on<_FetchTrendingSeries>(_onFetchTrendingSeries);
  }

  Future<void> _onFetchTrendingMovies(
    _FetchTrendingMovies event,
    Emitter<MovieState> emit,
  ) async {
    final failureOrMovies = await _getTrendingMovies(NoParams());

    failureOrMovies.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (movies) => emit(state.copyWith(movies: movies)),
    );
  }

  Future<void> _onFetchTrendingSeries(
    _FetchTrendingSeries event,
    Emitter<MovieState> emit,
  ) async {
    emit(SerieLoading());

    final failureOrSeries = await _getTrendingSeries(NoParams());

    failureOrSeries.fold(
      (failure) => emit(state.copyWith(failure: failure)),
      (series) => emit(state.copyWith(movies: movies)),
    );
  }

 
}
