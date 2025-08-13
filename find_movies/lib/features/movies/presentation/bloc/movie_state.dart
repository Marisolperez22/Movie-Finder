part of 'movie_bloc.dart';

@freezed
abstract class MovieState with _$MovieState {
  const MovieState._();

  factory MovieState({
    required List<Movie> movies,
    required List<Movie> series,
  }) = _MovieState;

  factory MovieState.initial() => MovieState(movies: [], series: []);
}
