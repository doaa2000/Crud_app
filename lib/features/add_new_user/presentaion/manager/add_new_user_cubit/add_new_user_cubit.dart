import 'package:bloc/bloc.dart';
import 'package:crud_app/core/errors/failure.dart';
import 'package:crud_app/features/get_all_users/presentaion/manager/users_list_cubit/get_all_users_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/repos/add_user_repo_impl.dart';

part 'add_new_user_state.dart';

class AddNewUserCubit extends Cubit<AddNewUserState> {
  AddNewUserCubit(this.usersRepo) : super(AddNewUserInitial());
  //final ApiService apiService;
  final AddNewUserRepoImpl usersRepo;
  //late UsersListCubit users;
  // UsersModel ?usersModel;
  static AddNewUserCubit Get(context) => BlocProvider.of(context);
  // GetAllUsersCubit? getAllUsersCubit;
  Future<void> addNewUser({
    required String name,
    required String email,
    required String gender,
    required String status,
  }) async {
    emit(AddNewUserLoading());
    var response = await usersRepo.addNewUser(
        name: name, email: email, gender: gender, status: status);

    response.fold((failure) {
      emit(AddNewUserFailure(failure.errorMessage));
    }, (newUser) {
      emit(AddNewUserSuccesful());
    });
  }
  // Future<void> addNewUser(
  //     {required String name,
  //     required String email,
  //     required String gender,
  //     required String status}) async {
  //   var response = await usersRepo.addNewUser(
  //     name: name,
  //     email: email,
  //     gender: gender,
  //     status: status,
  //   );
  //   response.fold((failure) {
  //     emit(AddNewUserFailure(failure.errorMessage));
  //   }, (data) {
  //     UsersModel.fromJson(data);
  //     emit(AddNewUserSuccesful());
  //   });

  //   // return UsersModel.fromJson(data);
  // }
}
