part of 'get_all_users_cubit.dart';

@immutable
abstract class GetAllUsersState {}

class GetAllUsersInitial extends GetAllUsersState {}

class GetAllUsersLoading extends GetAllUsersState {}

class GetAllUsersSuccessful extends GetAllUsersState {
  final List<UsersModel> users;

  GetAllUsersSuccessful(this.users);
}

class GetAllUsersFailure extends GetAllUsersState {
  final String errorMessage;

  GetAllUsersFailure(this.errorMessage);
}

class UpdateUserInitial extends GetAllUsersState {}

class AddNewUserSuccesful extends GetAllUsersState {}

class UpdateuserLoading extends GetAllUsersState {}

class UpdateUserSuccesful extends GetAllUsersState {
  final List<UsersModel> users;

  UpdateUserSuccesful(this.users);
}

class UpdateUserFailure extends GetAllUsersState {}
