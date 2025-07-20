import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_assignment_app/common/color_pallet/color_pallet.dart';
import 'package:inshorts_assignment_app/common/enums/api_status_enums.dart';
import 'package:inshorts_assignment_app/common/response_models/now_playing_movies_response/now_playing_movies_response.dart';
import 'package:inshorts_assignment_app/common/routing/app_routes.dart';
import 'package:inshorts_assignment_app/pages/home_page/home_page_controller.dart';

class HomePageScreen extends StatelessWidget {
  HomePageScreen({super.key});
  final controller = Get.put(
    HomePageController(),
    permanent: false,
    tag: DateTime.now().millisecondsSinceEpoch.toString(),
  );

  Widget _buildCarousel({
    required String title,
    required List<Movie> movies,
    bool showAddButton = true,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 250,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            itemCount: movies.length,
            separatorBuilder: (_, __) => SizedBox(width: 12),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: InkWell(
                  onTap: () {
                    final selectedMovieId = movies[index].id;
                    Get.toNamed(
                      AppRoutes.movieDetailPage,
                      parameters: {'movieId': selectedMovieId.toString()},
                    );
                  },
                  child: SizedBox(
                    height: 400,
                    width: 100,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 150,
                          width: 120,
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original${movies[index].posterPath ?? ''}",
                            fit: BoxFit.cover,
                          ),
                        ),
                        Text(
                          movies[index].title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (showAddButton) ...{
                          ElevatedButton(
                            onPressed: () => controller.onBookmarkedClicked(
                              movie: movies[index],
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.red,
                              minimumSize: Size(double.infinity, 30),
                            ),
                            child: Text(
                              "Add",
                              style: TextStyle(
                                color: AppColors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        },
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildMovieSection({
    required String title,
    required List<Movie> movies,
    required Rx<ApiStatus> apiStatus,
    bool showAddButton = true,
  }) {
    return Obx(() {
      if (apiStatus.value == ApiStatus.loading) {
        return Center(child: CircularProgressIndicator(color: Colors.red));
      } else if (apiStatus.value == ApiStatus.noData) {
        return Center(
          child: Text(
            'No Movies Available',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        );
      } else if (apiStatus.value == ApiStatus.success) {
        return _buildCarousel(
          title: title,
          movies: movies,
          showAddButton: showAddButton,
        );
      } else {
        return SizedBox.shrink();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16.0,
                  horizontal: 24.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'TMDB',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoutes.searchPage);
                      },
                      child: Icon(Icons.search, color: Colors.white, size: 28),
                    ),
                  ],
                ),
              ),
              Obx(() {
                if (controller.nowPlayingMoviesApiStatus.value ==
                    ApiStatus.success) {
                  // Display the featured movie if available
                  return InkWell(
                    onTap: () {
                      final selectedMovieId =
                          controller.nowPlayingMovies.first.id;
                      Get.toNamed(
                        AppRoutes.movieDetailPage,
                        parameters: {'movieId': selectedMovieId.toString()},
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 8.0,
                      ),
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: NetworkImage(
                            "https://image.tmdb.org/t/p/original${controller.nowPlayingMovies.first.posterPath!}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          gradient: LinearGradient(
                            colors: [Colors.black, Colors.transparent],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'Featured Movie',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                return SizedBox.shrink();
              }),

              buildMovieSection(
                apiStatus: controller.nowPlayingMoviesApiStatus,
                title: 'Now Playing',
                movies: controller.nowPlayingMovies,
              ),
              buildMovieSection(
                apiStatus: controller.trendingPlayingMoviesApiStatus,
                title: 'Trending Now',
                movies: controller.trendingPlayingMovies,
              ),
              buildMovieSection(
                apiStatus: controller.bookMarkedMoviesApiStatus,
                title: 'Bookmarks',
                movies: controller.bookMarkedMovies,
                showAddButton: false, // No add button for bookmarks
              ),
            ],
          ),
        ),
      ),
    );
  }
}
