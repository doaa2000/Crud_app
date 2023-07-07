import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../models/users_model.dart';

abstract class UsersRepo {
  Future<Either<Failure, List<UsersModel>>> fetchUsersList();
}
