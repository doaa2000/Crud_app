import 'package:crud_app/core/errors/failure.dart';
import 'package:crud_app/features/list_view_screen/data/models/users_model.dart';
import 'package:crud_app/features/list_view_screen/data/repos/users_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../core/utils/api_service.dart';

List<UsersModel> users = [];

class UsersRepoImpl implements UsersRepo {
  final ApiService apiService;

  UsersRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<UsersModel>>> fetchUsersList() async {
    try {
      var data = await apiService.get(endPoint: 'users');

      for (int i = 0; i < data.length; i++) {
        users.add(UsersModel.fromJson(data[i]));
      }
      return right(users);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, UsersModel>> addNewUser(
      {required String name,
      required String email,
      required String gender,
      required String status}) async {
    try {
      var data = await apiService.post(
        endPoint: 'users',
        body: {
          'name': name,
          'email': email,
          'gender': gender,
          'status': status
        },
      );
      print(data);
      return right(UsersModel.fromJson(data));
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}
