import 'package:dio/dio.dart';
import 'package:so_mobile_app/config/constants/environment.dart';

class ListPeopleImpl {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  Future<dynamic> post(String dni) async {
    final response = await dio.post('path', data: {"dni": dni});

    return response;
  }
}
