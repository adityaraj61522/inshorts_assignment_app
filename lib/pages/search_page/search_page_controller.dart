// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:get/get.dart';
import 'package:inshorts_assignment_app/common/api_service/api_service.dart';
import 'package:inshorts_assignment_app/common/api_service/dio_client.dart';
import 'package:inshorts_assignment_app/common/response_models/now_playing_movies_response/now_playing_movies_response.dart';
import 'package:inshorts_assignment_app/common/routing/app_routes.dart';

class SearchPageController extends GetxController {
  final dio = DioClient().dio;
  final searchResults = <Movie>[].obs;
  final isLoading = false.obs;
  Timer? _debounce;

  // Debounced search handler
  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        _searchMovies(query);
      } else {
        searchResults.clear();
      }
    });
  }

  Future<void> _searchMovies(String query) async {
    isLoading.value = true;
    final apiService = ApiService(dio);

    try {
      final response = await apiService.searchMovies(query: query);
      if (response != null && response.results.isNotEmpty) {
        searchResults.value = response.results;
      } else {
        searchResults.clear();
      }
    } catch (e) {
      searchResults.clear();
    } finally {
      isLoading.value = false;
    }
  }

  void onMovieTapped(Movie movie) {
    // Navigate to movie details page
    Get.toNamed(
      AppRoutes.movieDetailPage,
      parameters: {'movieId': movie.id.toString()},
    );
  }

  @override
  void onClose() {
    _debounce?.cancel();
    super.onClose();
  }
}
