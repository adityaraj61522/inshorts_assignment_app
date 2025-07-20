// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_datail_response.dart';

MovieDetails _$MovieDetailsFromJson(Map<String, dynamic> json) => MovieDetails(
  id: json['id'] as int,
  title: json['title'] as String,
  overview: json['overview'] as String,
  originalLanguage: json['original_language'] as String,
  originalTitle: json['original_title'] as String,
  posterPath: json['poster_path'] as String?,
  backdropPath: json['backdrop_path'] as String?,
  releaseDate: json['release_date'] as String,
  popularity: (json['popularity'] as num).toDouble(),
  voteAverage: (json['vote_average'] as num).toDouble(),
  voteCount: json['vote_count'] as int,
  adult: json['adult'] as bool,
  video: json['video'] as bool,
  budget: json['budget'] as int,
  revenue: json['revenue'] as int,
  runtime: json['runtime'] as int,
  status: json['status'] as String,
  tagline: json['tagline'] as String?,
  homepage: json['homepage'] as String,
  imdbId: json['imdb_id'] as String,
  genres: (json['genres'] as List<dynamic>)
      .map((e) => Genre.fromJson(e as Map<String, dynamic>))
      .toList(),
  productionCompanies: (json['production_companies'] as List<dynamic>)
      .map((e) => ProductionCompany.fromJson(e as Map<String, dynamic>))
      .toList(),
  productionCountries: (json['production_countries'] as List<dynamic>)
      .map((e) => ProductionCountry.fromJson(e as Map<String, dynamic>))
      .toList(),
  spokenLanguages: (json['spoken_languages'] as List<dynamic>)
      .map((e) => SpokenLanguage.fromJson(e as Map<String, dynamic>))
      .toList(),
  originCountry: (json['origin_country'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  belongsToCollection: json['belongs_to_collection'] == null
      ? null
      : BelongsToCollection.fromJson(
          json['belongs_to_collection'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$MovieDetailsToJson(
  MovieDetails instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'overview': instance.overview,
  'original_language': instance.originalLanguage,
  'original_title': instance.originalTitle,
  'poster_path': instance.posterPath,
  'backdrop_path': instance.backdropPath,
  'release_date': instance.releaseDate,
  'popularity': instance.popularity,
  'vote_average': instance.voteAverage,
  'vote_count': instance.voteCount,
  'adult': instance.adult,
  'video': instance.video,
  'budget': instance.budget,
  'revenue': instance.revenue,
  'runtime': instance.runtime,
  'status': instance.status,
  'tagline': instance.tagline,
  'homepage': instance.homepage,
  'imdb_id': instance.imdbId,
  'genres': instance.genres.map((e) => e.toJson()).toList(),
  'production_companies': instance.productionCompanies
      .map((e) => e.toJson())
      .toList(),
  'production_countries': instance.productionCountries
      .map((e) => e.toJson())
      .toList(),
  'spoken_languages': instance.spokenLanguages.map((e) => e.toJson()).toList(),
  'origin_country': instance.originCountry,
  'belongs_to_collection': instance.belongsToCollection?.toJson(),
};

Genre _$GenreFromJson(Map<String, dynamic> json) =>
    Genre(id: json['id'] as int, name: json['name'] as String);

Map<String, dynamic> _$GenreToJson(Genre instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};

ProductionCompany _$ProductionCompanyFromJson(Map<String, dynamic> json) =>
    ProductionCompany(
      id: json['id'] as int,
      name: json['name'] as String,
      logoPath: json['logo_path'] as String?,
      originCountry: json['origin_country'] as String,
    );

Map<String, dynamic> _$ProductionCompanyToJson(ProductionCompany instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'logo_path': instance.logoPath,
      'origin_country': instance.originCountry,
    };

ProductionCountry _$ProductionCountryFromJson(Map<String, dynamic> json) =>
    ProductionCountry(
      iso: json['iso_3166_1'] as String,
      name: json['name'] as String,
    );

Map<String, dynamic> _$ProductionCountryToJson(ProductionCountry instance) =>
    <String, dynamic>{'iso_3166_1': instance.iso, 'name': instance.name};

SpokenLanguage _$SpokenLanguageFromJson(Map<String, dynamic> json) =>
    SpokenLanguage(
      iso: json['iso_639_1'] as String,
      englishName: json['english_name'] as String,
    );

Map<String, dynamic> _$SpokenLanguageToJson(SpokenLanguage instance) =>
    <String, dynamic>{
      'iso_639_1': instance.iso,
      'english_name': instance.englishName,
    };

BelongsToCollection _$BelongsToCollectionFromJson(Map<String, dynamic> json) =>
    BelongsToCollection(
      id: json['id'] as int,
      name: json['name'] as String,
      posterPath: json['poster_path'] as String?,
      backdropPath: json['backdrop_path'] as String?,
    );

Map<String, dynamic> _$BelongsToCollectionToJson(
  BelongsToCollection instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'poster_path': instance.posterPath,
  'backdrop_path': instance.backdropPath,
};
