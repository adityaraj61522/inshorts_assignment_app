import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'now_playing_movies_response.g.dart';

@HiveType(typeId: 0)
@JsonSerializable()
class NowPlayingMoviesResponse {
  @HiveField(0)
  final int page;

  @HiveField(1)
  final List<Movie> results;

  @HiveField(2)
  @JsonKey(name: 'total_pages')
  final int totalPages;

  @HiveField(3)
  @JsonKey(name: 'total_results')
  final int totalResults;

  NowPlayingMoviesResponse({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  factory NowPlayingMoviesResponse.fromJson(Map<String, dynamic> json) =>
      _$NowPlayingMoviesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NowPlayingMoviesResponseToJson(this);
}

@HiveType(typeId: 1)
@JsonSerializable()
class Movie {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String title;

  @HiveField(2)
  final String overview;

  @HiveField(3)
  @JsonKey(name: 'original_language')
  final String originalLanguage;

  @HiveField(4)
  @JsonKey(name: 'original_title')
  final String originalTitle;

  @HiveField(5)
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @HiveField(6)
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  @HiveField(7)
  @JsonKey(name: 'release_date')
  final String releaseDate;

  @HiveField(8)
  final double popularity;

  @HiveField(9)
  @JsonKey(name: 'vote_average')
  final double voteAverage;

  @HiveField(10)
  @JsonKey(name: 'vote_count')
  final int voteCount;

  @HiveField(11)
  final List<int> genreIds;

  @HiveField(12)
  final bool adult;

  @HiveField(13)
  final bool video;

  Movie({
    required this.id,
    required this.title,
    required this.overview,
    required this.originalLanguage,
    required this.originalTitle,
    this.posterPath,
    this.backdropPath,
    required this.releaseDate,
    required this.popularity,
    required this.voteAverage,
    required this.voteCount,
    required this.genreIds,
    required this.adult,
    required this.video,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);

  Map<String, dynamic> toJson() => _$MovieToJson(this);
}
