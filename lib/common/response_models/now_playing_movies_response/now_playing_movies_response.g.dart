// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_movies_response.dart';

// ------------------- JSON SERIALIZATION -------------------

NowPlayingMoviesResponse _$NowPlayingMoviesResponseFromJson(
  Map<String, dynamic> json,
) {
  return NowPlayingMoviesResponse(
    page: json['page'] as int,
    results: (json['results'] as List<dynamic>)
        .map((e) => Movie.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['total_pages'] as int,
    totalResults: json['total_results'] as int,
  );
}

Map<String, dynamic> _$NowPlayingMoviesResponseToJson(
  NowPlayingMoviesResponse instance,
) => <String, dynamic>{
  'page': instance.page,
  'results': instance.results.map((e) => e.toJson()).toList(),
  'total_pages': instance.totalPages,
  'total_results': instance.totalResults,
};

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
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
    genreIds: (json['genre_ids'] as List<dynamic>)
        .map((e) => e as int)
        .toList(),
    adult: json['adult'] as bool,
    video: json['video'] as bool,
  );
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
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
  'genre_ids': instance.genreIds,
  'adult': instance.adult,
  'video': instance.video,
};

// ------------------- HIVE TYPE ADAPTERS -------------------

class NowPlayingMoviesResponseAdapter
    extends TypeAdapter<NowPlayingMoviesResponse> {
  @override
  final int typeId = 0;

  @override
  NowPlayingMoviesResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return NowPlayingMoviesResponse(
      page: fields[0] as int,
      results: (fields[1] as List).cast<Movie>(),
      totalPages: fields[2] as int,
      totalResults: fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, NowPlayingMoviesResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.page)
      ..writeByte(1)
      ..write(obj.results)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.totalResults);
  }
}

class MovieAdapter extends TypeAdapter<Movie> {
  @override
  final int typeId = 1;

  @override
  Movie read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (var i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Movie(
      id: fields[0] as int,
      title: fields[1] as String,
      overview: fields[2] as String,
      originalLanguage: fields[3] as String,
      originalTitle: fields[4] as String,
      posterPath: fields[5] as String?,
      backdropPath: fields[6] as String?,
      releaseDate: fields[7] as String,
      popularity: fields[8] as double,
      voteAverage: fields[9] as double,
      voteCount: fields[10] as int,
      genreIds: (fields[11] as List).cast<int>(),
      adult: fields[12] as bool,
      video: fields[13] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Movie obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.overview)
      ..writeByte(3)
      ..write(obj.originalLanguage)
      ..writeByte(4)
      ..write(obj.originalTitle)
      ..writeByte(5)
      ..write(obj.posterPath)
      ..writeByte(6)
      ..write(obj.backdropPath)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.popularity)
      ..writeByte(9)
      ..write(obj.voteAverage)
      ..writeByte(10)
      ..write(obj.voteCount)
      ..writeByte(11)
      ..write(obj.genreIds)
      ..writeByte(12)
      ..write(obj.adult)
      ..writeByte(13)
      ..write(obj.video);
  }
}
