import 'package:crud_app/core/errors/failure.dart';
import 'package:crud_app/core/utils/services/api_services.dart';
import 'package:crud_app/features/get_all_users/data/models/users_model.dart';
import 'package:crud_app/features/update_user/data/repos/update_user_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constants.dart';
import '../../../get_all_users/data/repos/users_repo_impl.dart';

class UpdateUserRepoImpl implements UpdateUserRepo {
  final ApiService apiService;

  UpdateUserRepoImpl(this.apiService);
  @override
  Future<Either<Failure, Map<String, dynamic>>> updateUser(
      {required String name,
      required String email,
      required int id,
      required String status}) async {
    try {
      var response = await apiService.put(endPoint: endPoint, id: id, data: {
        'name': name,
        'email': email,
        'id': id,
      });

      users.add(UsersModel.fromJson(response));
      return right(response);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  Future<void> DeleteUser({required int id}) async {
    try {
      var response = await apiService.delete(endPoint: endPoint, id: id);
    } on Exception catch (e) {
      if (e is DioError) {
        final errorMessage = ServerFailure.fromDioError(e).toString();
        throw errorMessage;
      }
    }
  }
}
