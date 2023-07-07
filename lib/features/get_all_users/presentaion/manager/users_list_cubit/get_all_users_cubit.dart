import 'package:bloc/bloc.dart';

import 'package:crud_app/core/utils/constants.dart';
import 'package:crud_app/features/add_new_user/presentaion/manager/add_new_user_cubit/add_new_user_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/services/api_services.dart';
import '../../../data/models/users_model.dart';
import '../../../data/repos/users_repo.dart';
import '../../../data/repos/users_repo_impl.dart';

part 'get_all_users_state.dart';

class GetAllUsersCubit extends Cubit<GetAllUsersState> {
  GetAllUsersCubit(this.usersRepo) : super(GetAllUsersInitial());
  static GetAllUsersCubit get(context) => BlocProvider.of(context);
  final UsersRepoImpl usersRepo;

  //UsersModel? usersModel;
  List<UsersModel> usersList = [];
  Future<void> FetchUsersList() async {
    emit(GetAllUsersLoading());

    var result = await usersRepo.fetchUsersList();

    result.fold(
      (failure) => emit(GetAllUsersFailure(failure.errorMessage)),
      (users) {
        emit(GetAllUsersSuccessful(users));
        usersList = users;
      },
    );
  }

  // Future<UsersModel> updateUser(
  //     {required String name,
  //     required String email,
  //     required String status,
  //     required int id}) async {
  //   Map<String, dynamic> data = await apiService.put(
  //     endPoint: 'users/$id',
  //     body: {
  //       'name': name,
  //       'email': email,
  //       'status': status,
  //     },
  //   );

  //   return UsersModel.fromJson(data);
  // }

  // Future<UsersModel> deleteUser({required int id}) async {
  //   Map<String, dynamic> data = await apiService.delete(
  //     endPoint: 'users/$id',
  //   );

  //   return UsersModel.fromJson(data);
  // }

  // Future<UsersModel> AddNewUser(
  //     {required String name,
  //     required String email,
  //     required String gender,
  //     required String status}) async {
  //   emit(UsersListLoading());
  //   Map<String, dynamic> data = await apiService.post(
  //     endPoint: 'users',
  //     body: {'name': name, 'email': email, 'gender': gender, 'status': status},
  //   );
  //   emit(AddNewUserSuccesful());
  //   return UsersModel.fromJson(data);
  // }
}
