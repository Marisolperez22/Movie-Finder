part of 'movie_bloc.dart';

@freezed
class MovieEvent with _$MovieEvent {
  const factory MovieEvent.fetchTrendingMovies() = _FetchTrendingMovies;
  const factory MovieEvent.fetchTrendingSeries() = _FetchTrendingSeries;
}
