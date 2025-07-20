// ignore_for_file: unnecessary_null_comparison

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inshorts_assignment_app/common/response_models/now_playing_movies_response/now_playing_movies_response.dart';
import 'package:inshorts_assignment_app/common/routing/app_routes.dart';
import 'package:inshorts_assignment_app/pages/home_page/home_page_controller.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(NowPlayingMoviesResponseAdapter());
  Hive.registerAdapter(MovieAdapter());

  Get.put(HomePageController());

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  StreamSubscription? _sub;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initDeepLinkListener();
    });
  }

  void _initDeepLinkListener() {
    final initialLink =
        WidgetsBinding.instance.platformDispatcher.defaultRouteName;

    if (initialLink != null && initialLink != "/") {
      _handleDeepLink(initialLink);
    }
  }

  void _handleDeepLink(String link) {
    Uri uri = Uri.parse(link);
    if (uri.pathSegments.contains('product')) {
      final id = uri.queryParameters['id'];
      if (id != null) {
        Get.toNamed(AppRoutes.movieDetailPage, parameters: {'movieId': id});
      }
    }
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Inshorts Assignment App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en', 'US'),
      initialRoute: AppRoutes.homePage,
      getPages: AppRoutes.routes,
    );
  }
}
