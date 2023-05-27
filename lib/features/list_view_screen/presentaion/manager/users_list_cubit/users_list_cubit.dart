import 'package:bloc/bloc.dart';
import 'package:crud_app/core/utils/api_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/users_model.dart';
import '../../../data/repos/users_repo.dart';
import '../../../data/repos/users_repo_impl.dart';

part 'users_list_state.dart';

class UsersListCubit extends Cubit<UsersListState> {
  UsersListCubit(this.usersRepo, this.apiService) : super(UsersListInitial());
  static UsersListCubit get(context) => BlocProvider.of(context);
  final UsersRepo usersRepo;
  final ApiService apiService;
  Future<void> FetchUsersList() async {
    emit(UsersListLoading());

    var result = await usersRepo.fetchUsersList();

    result.fold(
      (failure) => emit(UsersListFailure(failure.errorMessage)),
      (users) => emit(UsersListSuccesful(users)),
    );
  }

  Future<UsersModel> updateUser(
      {required String name,
      required String email,
      required String status,
      required int id}) async {
    Map<String, dynamic> data = await apiService.put(
      endPoint: 'users/$id',
      body: {
        'name': name,
        'email': email,
        'status': status,
      },
    );

    return UsersModel.fromJson(data);
  }

  Future<UsersModel> deleteUser({required int id}) async {
    Map<String, dynamic> data = await apiService.delete(
      endPoint: 'users/$id',
    );

    return UsersModel.fromJson(data);
  }

  // Future<void> AddNewUser( {required String name,
  //     required String email,
  //     required String gender,
  //     required String status}) async {
  //   emit(UsersListLoading());
  //   var result = await usersRepo.addNewUser(
  //     email: name,
  //     name:email ,
  //     gender: gender,
  //     status: status,
  //   );

  // }
}
