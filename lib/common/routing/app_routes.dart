import 'package:get/get.dart';
import 'package:inshorts_assignment_app/pages/home_page/home_page_view.dart';
import 'package:inshorts_assignment_app/pages/movie_detail_page/detail_page_view.dart';

class AppRoutes {
  static const String homePage = '/';
  static const String movieDetailPage = '/movieDetail';

  static final routes = [
    GetPage(
      name: homePage,
      page: () => HomePageScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: movieDetailPage,
      page: () => MovieDetailScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
