import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:so_mobile_app/config/constants/environment.dart';

class SaveTransfer {
  final dio = Dio(BaseOptions(baseUrl: Environment.apiUrl));

  Future<dynamic> post(Float amount, String message) async {
    final response = await dio.post(
      'path',
      data: {"amount": amount, "message": message},
    );

    return response;
  }
}
