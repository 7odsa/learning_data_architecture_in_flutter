import 'package:dio/dio.dart';

final dio = Dio();

Future<Map<String, dynamic>> getHttp() async {
  final Response<Map<String, dynamic>> response = await dio.get(
    "https://v2.jokeapi.dev/joke/Any",
  );
  print(response.data);
  return response.data!;
}
