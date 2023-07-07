import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../features/get_all_users/data/models/users_model.dart';
import '../../../features/get_all_users/data/repos/users_repo_impl.dart';
import '../constants.dart';

class ApiService {
  final _baseUrl = 'https://gorest.co.in/public/v2/';

  final Dio dio;

  ApiService(this.dio);

  Future<dynamic> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint');
    print(response.data);
    return response.data;
  }

  Future<dynamic> post(
      {required String endPoint, required dynamic data}) async {
    var response = await dio.post(
      '$_baseUrl$endPoint',
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $TOKEN',
        },
      ),
    );
    return response.data;
  }

  Future<dynamic> put(
      {required String endPoint,
      required int id,
      required dynamic data}) async {
    var response = await dio.put(
      '$_baseUrl$endPoint/$id',
      data: data,
      options: Options(
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $TOKEN',
        },
      ),
    );
    return response.data;
  }

  Future<void> delete({required String endPoint, required int id}) async {
    var response = await dio.delete(
      '$_baseUrl$endPoint/$id',
    );
  }

  // Future<void> deleteUser({required int id}) async {
  //   try {
  //     await _dio.delete('/users/$id');
  //   } on DioError catch (err) {
  //     final errorMessage = DioException.fromDioError(err).toString();
  //     throw errorMessage;
  //   } catch (e) {
  //     if (kDebugMode) print(e);
  //     throw e.toString();
  //   }
  // }
  // Future<dynamic> post(
  //     {required String endPoint, @required dynamic body}) async {
  //   var response = await dio.post(
  //     '$_baseUrl$endPoint',
  //     data: body,
  //     options: Options(
  //       headers: {
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json',
  //         'Authorization':
  //             'Bearer 6e48d8dbae46f23c6d956c9f624ca651013ae0fb4436bb9ca80c712f4d2c730f'
  //       },
  //     ),
  //   );

  //   users.add(UsersModel.fromJson(response.data));

  //   return response.data;
  // }

  // Future<dynamic> put(
  //     {required String endPoint, @required dynamic body}) async {
  //   var response = await dio.put(
  //     '$_baseUrl$endPoint',
  //     data: body,
  //     options: Options(
  //       headers: {
  //         'Accept': 'application/json',
  //         'Content-Type': 'application/json',
  //         'Authorization':
  //             'Bearer 6e48d8dbae46f23c6d956c9f624ca651013ae0fb4436bb9ca80c712f4d2c730f'
  //       },
  //     ),
  //   );
  //   users.add(UsersModel.fromJson(response.data));
  //   print(response.data);

  //   return response.data;
  // }
}
