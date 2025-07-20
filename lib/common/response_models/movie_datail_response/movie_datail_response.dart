import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie_datail_response.g.dart';

@HiveType(typeId: 2)
@JsonSerializable()
class MovieDetails {
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
  final bool adult;

  @HiveField(12)
  final bool video;

  @HiveField(13)
  final int budget;

  @HiveField(14)
  final int revenue;

  @HiveField(15)
  final int runtime;

  @HiveField(16)
  final String status;

  @HiveField(17)
  final String? tagline;

  @HiveField(18)
  final String homepage;

  @HiveField(19)
  @JsonKey(name: 'imdb_id')
  final String imdbId;

  @HiveField(20)
  final List<Genre> genres;

  @HiveField(21)
  @JsonKey(name: 'production_companies')
  final List<ProductionCompany> productionCompanies;

  @HiveField(22)
  @JsonKey(name: 'production_countries')
  final List<ProductionCountry> productionCountries;

  @HiveField(23)
  @JsonKey(name: 'spoken_languages')
  final List<SpokenLanguage> spokenLanguages;

  @HiveField(24)
  final List<String> originCountry;

  @HiveField(25)
  @JsonKey(name: 'belongs_to_collection')
  final BelongsToCollection? belongsToCollection;

  MovieDetails({
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
    required this.adult,
    required this.video,
    required this.budget,
    required this.revenue,
    required this.runtime,
    required this.status,
    this.tagline,
    required this.homepage,
    required this.imdbId,
    required this.genres,
    required this.productionCompanies,
    required this.productionCountries,
    required this.spokenLanguages,
    required this.originCountry,
    this.belongsToCollection,
  });

  factory MovieDetails.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailsToJson(this);
}

@HiveType(typeId: 3)
@JsonSerializable()
class Genre {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) => _$GenreFromJson(json);

  Map<String, dynamic> toJson() => _$GenreToJson(this);
}

@HiveType(typeId: 4)
@JsonSerializable()
class ProductionCompany {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  @JsonKey(name: 'logo_path')
  final String? logoPath;

  @HiveField(3)
  @JsonKey(name: 'origin_country')
  final String originCountry;

  ProductionCompany({
    required this.id,
    required this.name,
    this.logoPath,
    required this.originCountry,
  });

  factory ProductionCompany.fromJson(Map<String, dynamic> json) =>
      _$ProductionCompanyFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCompanyToJson(this);
}

@HiveType(typeId: 5)
@JsonSerializable()
class ProductionCountry {
  @HiveField(0)
  @JsonKey(name: 'iso_3166_1')
  final String iso;

  @HiveField(1)
  final String name;

  ProductionCountry({required this.iso, required this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json) =>
      _$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson() => _$ProductionCountryToJson(this);
}

@HiveType(typeId: 6)
@JsonSerializable()
class SpokenLanguage {
  @HiveField(0)
  @JsonKey(name: 'iso_639_1')
  final String iso;

  @HiveField(1)
  @JsonKey(name: 'english_name')
  final String englishName;

  SpokenLanguage({required this.iso, required this.englishName});

  factory SpokenLanguage.fromJson(Map<String, dynamic> json) =>
      _$SpokenLanguageFromJson(json);

  Map<String, dynamic> toJson() => _$SpokenLanguageToJson(this);
}

@HiveType(typeId: 7)
@JsonSerializable()
class BelongsToCollection {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  @JsonKey(name: 'poster_path')
  final String? posterPath;

  @HiveField(3)
  @JsonKey(name: 'backdrop_path')
  final String? backdropPath;

  BelongsToCollection({
    required this.id,
    required this.name,
    this.posterPath,
    this.backdropPath,
  });

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) =>
      _$BelongsToCollectionFromJson(json);

  Map<String, dynamic> toJson() => _$BelongsToCollectionToJson(this);
}
