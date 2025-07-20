// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:inshorts_assignment_app/common/api_service/api_service.dart';
import 'package:inshorts_assignment_app/common/api_service/dio_client.dart';
import 'package:inshorts_assignment_app/common/enums/api_status_enums.dart';
import 'package:inshorts_assignment_app/common/response_models/now_playing_movies_response/now_playing_movies_response.dart';

class HomePageController extends GetxController {
  final dio = DioClient().dio;

  final nowPlayingMovies = <Movie>[].obs;
  final nowPlayingMoviesApiStatus = ApiStatus.initial.obs;

  final trendingPlayingMovies = <Movie>[].obs;
  final trendingPlayingMoviesApiStatus = ApiStatus.initial.obs;

  final bookMarkedMovies = <Movie>[].obs;
  final bookMarkedMoviesApiStatus = ApiStatus.initial.obs;

  @override
  void onInit() async {
    super.onInit();
    await fetchNowPlayingMovies();
    await fetchTrendingMovies();
  }

  Future<void> fetchNowPlayingMovies() async {
    nowPlayingMoviesApiStatus.value = ApiStatus.loading;
    final apiService = ApiService(dio);

    try {
      NowPlayingMoviesResponse response = await apiService
          .getNowPlayingMovies();
      if (response != null) {
        if (response.results.isNotEmpty) {
          nowPlayingMovies.value = response.results;
          nowPlayingMoviesApiStatus.value = ApiStatus.success;
        } else {
          nowPlayingMoviesApiStatus.value = ApiStatus.noData;
        }
      } else {
        {
          nowPlayingMoviesApiStatus.value = ApiStatus.error;
        }
      }
    } catch (e) {
      nowPlayingMoviesApiStatus.value = ApiStatus.error;
      print("Error fetching movies: $e");
    }
  }

  Future<void> fetchTrendingMovies() async {
    trendingPlayingMoviesApiStatus.value = ApiStatus.loading;
    final apiService = ApiService(dio);

    try {
      NowPlayingMoviesResponse response = await apiService.getTrendingMovies();
      if (response != null) {
        if (response.results.isNotEmpty) {
          trendingPlayingMovies.value = response.results;
          trendingPlayingMoviesApiStatus.value = ApiStatus.success;
        } else {
          trendingPlayingMoviesApiStatus.value = ApiStatus.noData;
        }
      } else {
        {
          trendingPlayingMoviesApiStatus.value = ApiStatus.error;
        }
      }
    } catch (e) {
      trendingPlayingMoviesApiStatus.value = ApiStatus.error;
      print("Error fetching movies: $e");
    }
  }
}
