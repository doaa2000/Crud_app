import 'package:crud_app/core/errors/failure.dart';
import 'package:crud_app/features/add_new_user/data/repos/add_user_repo.dart';
import 'package:crud_app/features/get_all_users/data/models/users_model.dart';
import 'package:crud_app/features/get_all_users/data/repos/users_repo_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/utils/services/api_services.dart';

class AddNewUserRepoImpl implements AddNewUserRepo {
  final ApiService apiService;

  AddNewUserRepoImpl(this.apiService);

  @override
  Future<Either<Failure, Map<String, dynamic>>> addNewUser(
      {required String name,
      required String email,
      required String gender,
      required String status}) async {
    try {
      var response = await apiService.post(endPoint: endPoint, data: {
        'name': name,
        'email': email,
        'gender': gender,
        'status': status,
      });

      users.add(UsersModel.fromJson(response));
      return right(response);
    } on Exception catch (e) {
      if (e is DioError) {
        return left(ServerFailure.fromDioError(e));
      }
      return Left(ServerFailure(e.toString()));
    }

//usermodel opject

    //return {id :'3493360', name :Deeptiman , email:hello@gmail.com, status:active}
  }

  // @override
  // Future<Either<Failure, UsersModel>> addNewUser(
  //     {required String name,
  //     required String email,
  //     required String gender,
  //     required String status

  //     }) async {
  //   // try {
  //   //   // var data = await apiService.post(
  //   //   //   endPoint: 'users',
  //   //   //   body: {
  //   //   //     'name': name,
  //   //   //     'email': email,
  //   //   //     'gender': gender,
  //   //   //     'status': status
  //   //   //   },
  //   //   );
  //   //   users.add(UsersModel.fromJson(data));
  //   //   print(data);
  //   //   return right(UsersModel.fromJson(data));
  //   // } on Exception catch (e) {
  //   //   if (e is DioError) {
  //   //     return left(ServerFailure.fromDioError(e));
  //   //   }
  //   //   return Left(ServerFailure(e.toString()));
  //   // }
  // }
}
