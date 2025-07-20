import 'package:get/get.dart';
import 'package:inshorts_assignment_app/pages/home_page/home_page_view.dart';
import 'package:inshorts_assignment_app/pages/movie_detail_page/detail_page_view.dart';
import 'package:inshorts_assignment_app/pages/search_page/search_page.dart';

class AppRoutes {
  static const String homePage = '/';
  static const String movieDetailPage = '/movieDetail';
  static const String searchPage = '/search';

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
    GetPage(
      name: searchPage,
      page: () => SearchPage(),
      transition: Transition.fadeIn,
    ),
  ];
}
