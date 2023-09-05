import 'package:dio/dio.dart';
import 'package:test_project/core/constant/app_url.dart';

class CharactersService {
  late Dio dio;
  CharactersService() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: AppUrl.baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(baseOptions);
  }

  //! Get
  Future<Map<String, dynamic>> getCharacters(String endPoint) async {
    Response response = await dio.get(endPoint);
    return response.data;
  }
}
