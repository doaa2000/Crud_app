part of 'update_user_cubit.dart';

abstract class UpdateUserState {}

class UpdateUserInitial extends UpdateUserState {}

class UpdateUserSuccessfullState extends UpdateUserState {}

class UpdateUserFailureState extends UpdateUserState {
  final String errorMessage;

  UpdateUserFailureState(this.errorMessage);
}

class UpdateUserLoadingState extends UpdateUserState {}

class UsersDeletedSuccessfullState extends UpdateUserState {}
