import '../../domain/entities/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    super.id,
    super.adult,
    super.video,
    super.title,
    super.genreIds,
    super.overview,
    super.voteCount,
    super.mediaType,
    super.popularity,
    super.posterPath,
    super.voteAverage,
    super.releaseDate,
    super.backdropPath,
    super.originalTitle,
    super.originalLanguage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      adult: json['adult'] ?? false,
      video: json['video'] ?? false,
      posterPath: json['poster_path'],
      overview: json['overview'] ?? '',
      voteCount: json['vote_count'] ?? 0,
      backdropPath: json['backdrop_path'],
      mediaType: json['media_type'] ?? 'movie',
      genreIds: List<int>.from(json['genre_ids'] ?? []),
      originalLanguage: json['original_language'] ?? 'en',
      title: json['title'] ?? json['name'] ?? 'Sin título',
      popularity: (json['popularity'] as num?)?.toDouble() ?? 0.0,
      releaseDate: json['release_date'] ?? json['first_air_date'],
      voteAverage: (json['vote_average'] as num?)?.toDouble() ?? 0.0,
      originalTitle: json['original_title'] ?? json['original_name'] ?? '',
    );
  }


}


extension MovieMapper on MovieModel {
  Movie toEntity() {
    return Movie(
      adult: adult,
      backdropPath: backdropPath,
      id: id,
      title: title,
      originalTitle: originalTitle,
      overview: overview,
      posterPath: posterPath,
      mediaType: mediaType,
      originalLanguage: originalLanguage,
      genreIds: genreIds,
      popularity: popularity,
      releaseDate: releaseDate,
      video: video,
      voteAverage: voteAverage,
      voteCount: voteCount,
    );
  }
}
