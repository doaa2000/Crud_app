import 'package:crud_app/core/errors/failure.dart';
import 'package:crud_app/features/get_all_users/data/repos/users_repo.dart';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/services/api_services.dart';
import '../models/users_model.dart';

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
}
