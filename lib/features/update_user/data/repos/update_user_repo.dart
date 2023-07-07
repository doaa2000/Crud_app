import 'package:crud_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UpdateUserRepo {
  Future<Either<Failure, Map<String, dynamic>>> updateUser({
    required String name,
    required String email,
    required String status,
    required int id,
  });

  Future<void> DeleteUser({
    required int id,
  });
}
