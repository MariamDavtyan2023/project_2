import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Network {
  static const String baseUrl = "https://score-up.velox.am/";
  static const String login = "api/user/login";

  BaseOptions options = BaseOptions(
    connectTimeout: const Duration(milliseconds: 20000),
    receiveTimeout: const Duration(milliseconds: 60000),
    baseUrl: baseUrl,
  );

 Future<void> identification(String phone, String password, BuildContext context) async {
    final Dio dio = Dio(options)..interceptors.add(LogInterceptor());
    final res = await dio.post(login, data: {
      'username': phone,
      'password': password,
      'deviceId': '12',
      'deviceOS': 'string',
      'deviceType': 'string',
      'appVersion': 'string'
    });

    if(res.statusCode == 200) {
      if (context.mounted) {
        await Navigator.pushReplacementNamed(context, '/request_list');
      }
    }
  }
}
