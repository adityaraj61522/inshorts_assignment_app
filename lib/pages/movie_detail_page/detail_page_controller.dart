// ignore_for_file: unnecessary_null_comparison

import 'package:get/get.dart' hide FormData, MultipartFile;
import 'package:inshorts_assignment_app/common/api_service/api_service.dart';
import 'package:inshorts_assignment_app/common/api_service/dio_client.dart';
import 'package:inshorts_assignment_app/common/enums/api_status_enums.dart';
import 'package:inshorts_assignment_app/common/response_models/movie_datail_response/movie_datail_response.dart';

class MovieDetailController extends GetxController {
  final dio = DioClient().dio;

  MovieDetails? movieDetails;
  final movieDetailsApiStatus = ApiStatus.initial.obs;
  final movieId = 0.obs;

  @override
  void onInit() async {
    super.onInit();
    if (Get.parameters['movieId'] != null) {
      movieId.value = int.parse(Get.parameters['movieId']!);
    } else {
      // Handle the case where movieId is not provided
      Get.snackbar("Error", "Movie ID is required to fetch details.");
      return;
    }
    await fetchMoviesDetail();
  }

  Future<void> fetchMoviesDetail() async {
    movieDetailsApiStatus.value = ApiStatus.loading;
    final apiService = ApiService(dio);

    try {
      MovieDetails response = await apiService.getMovieDetails(
        int.parse(movieId.value.toString()),
      );
      if (response != null) {
        movieDetails = response;
        movieDetailsApiStatus.value = ApiStatus.success;
      } else {
        {
          movieDetailsApiStatus.value = ApiStatus.error;
        }
      }
    } catch (e) {
      movieDetailsApiStatus.value = ApiStatus.error;
      print("Error fetching movies: $e");
    }
  }
}
