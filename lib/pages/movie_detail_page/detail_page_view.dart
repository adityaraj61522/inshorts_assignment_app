import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inshorts_assignment_app/common/color_pallet/color_pallet.dart';
import 'package:inshorts_assignment_app/common/enums/api_status_enums.dart';
import 'package:inshorts_assignment_app/pages/movie_detail_page/detail_page_controller.dart';

class MovieDetailScreen extends StatelessWidget {
  MovieDetailScreen({super.key});
  final controller = Get.put(
    MovieDetailController(),
    permanent: false,
    tag: DateTime.now().millisecondsSinceEpoch.toString(),
  );

  Widget buildDetails() {
    return Column(
      children: [
        SizedBox(
          height: 300,
          width: double.infinity,
          child: Image.network(
            "https://image.tmdb.org/t/p/original${controller.movieDetails?.posterPath ?? ''}",
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          controller.movieDetails?.title ?? 'No Title',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
        SizedBox(height: 8),
        Divider(),
        SizedBox(height: 8),
        Text(
          controller.movieDetails?.overview ?? 'No Overview',
          style: TextStyle(
            color: Colors.grey,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => {},
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.red,
            minimumSize: Size(double.infinity, 50),
          ),
          child: Text(
            "Add Movie to Watchlist",
            style: TextStyle(
              color: AppColors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }

  Widget buildMovieSection() {
    return Obx(() {
      if (controller.movieDetailsApiStatus.value == ApiStatus.loading) {
        return Center(child: CircularProgressIndicator(color: Colors.red));
      } else if (controller.movieDetailsApiStatus.value == ApiStatus.noData) {
        return Center(
          child: Text(
            'No Movies Available',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        );
      } else if (controller.movieDetailsApiStatus.value == ApiStatus.success) {
        return buildDetails();
      } else {
        return Center(
          child: Text(
            'Error occured while fetching movie details!!',
            style: TextStyle(color: Colors.red, fontSize: 16),
          ),
        );
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
            children: [buildMovieSection()],
          ),
        ),
      ),
    );
  }
}
