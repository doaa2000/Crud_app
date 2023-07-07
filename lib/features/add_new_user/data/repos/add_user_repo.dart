import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../get_all_users/data/models/users_model.dart';

abstract class AddNewUserRepo {
  Future<Either<Failure, Map<String, dynamic>>> addNewUser(
      {required String name,
      required String email,
      required String gender,
      required String status});
}
