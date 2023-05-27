import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../features/list_view_screen/data/models/users_model.dart';
import '../../features/list_view_screen/data/repos/users_repo_impl.dart';

class ApiService {
  final _baseUrl = 'https://gorest.co.in/public/v2/';

  final Dio dio;

  ApiService(this.dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');

    return response.data;
  }

  Future<dynamic> post(
      {required String endPoint, @required dynamic body}) async {
    var response = await dio.post(
      '$_baseUrl$endPoint',
      data: body,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 6e48d8dbae46f23c6d956c9f624ca651013ae0fb4436bb9ca80c712f4d2c730f'
        },
      ),
    );

    users.add(UsersModel.fromJson(response.data));

    return response.data;
  }

  Future<dynamic> put(
      {required String endPoint, @required dynamic body}) async {
    var response = await dio.put(
      '$_baseUrl$endPoint',
      data: body,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 6e48d8dbae46f23c6d956c9f624ca651013ae0fb4436bb9ca80c712f4d2c730f'
        },
      ),
    );
    users.add(UsersModel.fromJson(response.data));
    print(response.data);

    return response.data;
  }

  Future<dynamic> delete({required String endPoint}) async {
    var response = await dio.delete(
      '$_baseUrl$endPoint',
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization':
              'Bearer 6e48d8dbae46f23c6d956c9f624ca651013ae0fb4436bb9ca80c712f4d2c730f'
        },
      ),
    );
    users.add(UsersModel.fromJson(response.data));
    print(response.data);

    return response.data;
  }
}
