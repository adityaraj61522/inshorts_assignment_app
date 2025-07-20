import 'package:dio/dio.dart';
import 'package:inshorts_assignment_app/common/response_models/movie_datail_response/movie_datail_response.dart';
import 'package:inshorts_assignment_app/common/response_models/now_playing_movies_response/now_playing_movies_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api.themoviedb.org/3/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("movie/now_playing")
  Future<NowPlayingMoviesResponse> getNowPlayingMovies({
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  @GET("movie/popular")
  Future<NowPlayingMoviesResponse> getTrendingMovies({
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
  });

  @GET("movie/{movie_id}")
  Future<MovieDetails> getMovieDetails(
    @Path("movie_id") int movieId, {
    @Query("language") String language = "en-US",
  });

  @GET("search/movie")
  Future<NowPlayingMoviesResponse> searchMovies({
    @Query("query") required String query,
    @Query("language") String language = "en-US",
    @Query("page") int page = 1,
    @Query("include_adult") bool includeAdult = false,
  });
}
