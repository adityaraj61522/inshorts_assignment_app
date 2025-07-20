// ignore_for_file: unnecessary_null_comparison

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:hive/hive.dart';
import 'package:inshorts_assignment_app/common/api_service/api_service.dart';
import 'package:inshorts_assignment_app/common/api_service/dio_client.dart';
import 'package:inshorts_assignment_app/common/enums/api_status_enums.dart';
import 'package:inshorts_assignment_app/common/response_models/now_playing_movies_response/now_playing_movies_response.dart';

class HomePageController extends GetxController {
  final dio = DioClient().dio;

  static const String nowPlayingBoxKey = 'now_playing_movies';
  static const String trendingBoxKey = 'trending_movies';
  static const String bookmarkedBoxKey = 'bookmarked_movies';
  late Box<Movie> nowPlayingMovieBox;
  late Box<Movie> trendingMovieBox;
  late Box<Movie> bookmarkedMovieBox;

  final nowPlayingMovies = <Movie>[].obs;
  final nowPlayingMoviesApiStatus = ApiStatus.initial.obs;

  final trendingPlayingMovies = <Movie>[].obs;
  final trendingPlayingMoviesApiStatus = ApiStatus.initial.obs;

  final bookMarkedMovies = <Movie>[].obs;
  final bookMarkedMoviesApiStatus = ApiStatus.initial.obs;

  @override
  void onInit() async {
    super.onInit();
    await _initNowPlayingHive();
    await _initTrendingHive();
    await _initBookmarkedHive();
    await fetchNowPlayingMovies();
    await fetchTrendingMovies();
    await fetchBookmarkedMovies();
  }

  Future<void> _initNowPlayingHive() async {
    if (!Hive.isBoxOpen(nowPlayingBoxKey)) {
      nowPlayingMovieBox = await Hive.openBox(nowPlayingBoxKey);
    }
    nowPlayingMovieBox = Hive.box(nowPlayingBoxKey);
  }

  Future<void> _initTrendingHive() async {
    if (!Hive.isBoxOpen(trendingBoxKey)) {
      trendingMovieBox = await Hive.openBox(trendingBoxKey);
    }
    trendingMovieBox = Hive.box(trendingBoxKey);
  }

  Future<void> _initBookmarkedHive() async {
    if (!Hive.isBoxOpen(bookmarkedBoxKey)) {
      bookmarkedMovieBox = await Hive.openBox(bookmarkedBoxKey);
    }
    bookmarkedMovieBox = Hive.box(bookmarkedBoxKey);
  }

  Future<bool> get hasInternetConnection async {
    final connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  Future<void> fetchNowPlayingMovies() async {
    nowPlayingMoviesApiStatus.value = ApiStatus.loading;
    final apiService = ApiService(dio);

    try {
      if (await hasInternetConnection) {
        NowPlayingMoviesResponse response = await apiService
            .getNowPlayingMovies();
        if (response != null) {
          if (response.results.isNotEmpty) {
            nowPlayingMovies.value = response.results;
            await nowPlayingMovieBox.clear();
            await nowPlayingMovieBox.addAll(
              response.results.map((m) => m).toList(),
            );
            nowPlayingMoviesApiStatus.value = ApiStatus.success;
          } else {
            nowPlayingMoviesApiStatus.value = ApiStatus.noData;
          }
        } else {
          {
            nowPlayingMoviesApiStatus.value = ApiStatus.error;
          }
        }
      } else {
        final cachedMovies = nowPlayingMovieBox.values.toList().cast<Movie>();
        if (cachedMovies.isNotEmpty) {
          nowPlayingMovies.value = cachedMovies;
          nowPlayingMoviesApiStatus.value = ApiStatus.success;
        } else {
          nowPlayingMoviesApiStatus.value = ApiStatus.error;
        }
      }
    } catch (e) {
      nowPlayingMoviesApiStatus.value = ApiStatus.error;
    }
  }

  Future<void> fetchTrendingMovies() async {
    trendingPlayingMoviesApiStatus.value = ApiStatus.loading;
    final apiService = ApiService(dio);

    try {
      if (await hasInternetConnection) {
        NowPlayingMoviesResponse response = await apiService
            .getTrendingMovies();
        if (response != null) {
          if (response.results.isNotEmpty) {
            trendingPlayingMovies.value = response.results;
            await trendingMovieBox.clear(); // Clear the box first
            await trendingMovieBox.addAll(
              response.results.map((m) => m).toList(),
            );
            trendingPlayingMoviesApiStatus.value = ApiStatus.success;
          } else {
            trendingPlayingMoviesApiStatus.value = ApiStatus.noData;
          }
        } else {
          {
            trendingPlayingMoviesApiStatus.value = ApiStatus.error;
          }
        }
      } else {
        final cachedMovies = trendingMovieBox.values.toList().cast<Movie>();
        if (cachedMovies.isNotEmpty) {
          trendingPlayingMovies.value = cachedMovies;
          trendingPlayingMoviesApiStatus.value = ApiStatus.success;
        } else {
          trendingPlayingMoviesApiStatus.value = ApiStatus.error;
        }
      }
    } catch (e) {
      trendingPlayingMoviesApiStatus.value = ApiStatus.error;
    }
  }

  fetchBookmarkedMovies() {
    bookMarkedMoviesApiStatus.value = ApiStatus.loading;
    final cachedMovies = bookmarkedMovieBox.values.toList().cast<Movie>();
    if (cachedMovies.isNotEmpty) {
      bookMarkedMovies.value = cachedMovies;
      bookMarkedMoviesApiStatus.value = ApiStatus.success;
    } else {
      bookMarkedMoviesApiStatus.value = ApiStatus.error;
    }
  }

  void onBookmarkedClicked({required Movie movie}) async {
    bookMarkedMoviesApiStatus.value = ApiStatus.loading;
    if (!bookMarkedMovies.contains(movie)) {
      bookMarkedMovies.add(movie);
      bookMarkedMoviesApiStatus.value = ApiStatus.success;
      return;
    }
    bookMarkedMovies.add(movie);
    await bookmarkedMovieBox.add(movie);
    bookMarkedMoviesApiStatus.value = ApiStatus.success;
  }
}
