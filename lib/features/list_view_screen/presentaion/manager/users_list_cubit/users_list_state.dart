part of 'users_list_cubit.dart';

@immutable
abstract class UsersListState {}

class UsersListInitial extends UsersListState {}

class UsersListLoading extends UsersListState {}

class UsersListSuccesful extends UsersListState {
  final List<UsersModel> users;

  UsersListSuccesful(this.users);
}

class UsersListFailure extends UsersListState {
  final String errorMessage;

  UsersListFailure(this.errorMessage);
}

class UpdateUserInitial extends UsersListState {}

class UpdateuserLoading extends UsersListState {}

class UpdateUserSuccesful extends UsersListState {
  final List<UsersModel> users;

  UpdateUserSuccesful(this.users);
}

class UpdateUserFailure extends UsersListState {}
