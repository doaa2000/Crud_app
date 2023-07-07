import 'package:equatable/equatable.dart';

class UsersModel extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? gender;
  final String? status;

  const UsersModel({
    this.id,
    this.name,
    this.email,
    this.gender,
    this.status,
  });

  factory UsersModel.fromJson(json) => UsersModel(
        id: json['id'] as int,
        name: json['name'] as String?,
        email: json['email'] as String?,
        gender: json['gender'] as String?,
        status: json['status'] as String?,
      );

  @override
  List<Object?> get props => [id, name, email, gender, status];
}
