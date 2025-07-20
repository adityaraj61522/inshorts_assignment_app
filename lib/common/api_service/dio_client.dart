import 'package:dio/dio.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  factory DioClient() => _instance;
  late Dio dio;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        headers: {
          "Authorization":
              "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiYTU5NThkYzdkODk3NGYxZTkyMTIzZmRmOGQ2ZWI0MCIsIm5iZiI6MTc1Mjk1NDE3NS43OTcsInN1YiI6IjY4N2JmNTNmMjhhNmI4OTY1NmQ5ODkwMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.V539WaKZWV7AI1EbBvioXNf3xX1gjpL7EsSvc_krTe0",
          "accept": "application/json",
        },
      ),
    )..interceptors.add(LogInterceptor(responseBody: true, requestBody: true));
  }
}
