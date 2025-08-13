class Movie {
  final int? id;
  final bool? adult;
  final bool? video;
  final String? title;
  final int? voteCount;
  final String? overview;
  final String? mediaType;
  final String? posterPath;
  final double? popularity;
  final List<int>? genreIds;
  final double? voteAverage;
  final String? releaseDate;
  final String? backdropPath;
  final String? originalTitle;
  final String? originalLanguage;

  Movie({
    this.id,
    this.adult,
    this.title,
    this.video,
    this.overview,
    this.genreIds,
    this.mediaType,
    this.voteCount,
    this.posterPath,
    this.popularity,
    this.releaseDate,
    this.voteAverage,
    this.backdropPath,
    this.originalTitle,
    this.originalLanguage,
  });

  String get fullBackdropPath =>
      backdropPath != null
          ? 'https://image.tmdb.org/t/p/w500$backdropPath'
          : 'https://via.placeholder.com/500x281?text=No+Backdrop';

  String get fullPosterPath =>
      posterPath != null
          ? 'https://image.tmdb.org/t/p/w500$posterPath'
          : 'https://via.placeholder.com/500x750?text=No+Poster';

  DateTime? get releaseDateTime =>
      releaseDate != null ? DateTime.tryParse(releaseDate!) : null;

  bool get isMovie => mediaType == 'movie';
  bool get isTvShow => mediaType == 'tv';
}
