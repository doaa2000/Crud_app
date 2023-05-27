part of 'add_new_user_cubit.dart';

@immutable
abstract class AddNewUserState {}

class AddNewUserInitial extends AddNewUserState {}

class AddNewUserLoading extends AddNewUserState {}

class AddNewUserSuccesful extends AddNewUserState {}

class AddNewUserFailure extends AddNewUserState {
  final String errorMessage;

  AddNewUserFailure(this.errorMessage);
}
