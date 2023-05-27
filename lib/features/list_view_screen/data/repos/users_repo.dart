import 'package:crud_app/features/list_view_screen/data/models/users_model.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class UsersRepo {
  Future<Either<Failure, List<UsersModel>>> fetchUsersList();
  Future<Either<Failure, UsersModel>> addNewUser(
      {required String name,
      required String email,
      required String gender,
      required String status});
}
