import 'package:bloc/bloc.dart';
import 'package:crud_app/core/utils/services/api_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/constants.dart';
import '../../../data/repos/update_user_repo_impl.dart';

part 'update_user_state.dart';

class UpdateUserCubit extends Cubit<UpdateUserState> {
  UpdateUserCubit(this.updateUserRepoImpl) : super(UpdateUserInitial());
  static UpdateUserCubit get(context) => BlocProvider.of(context);
  final UpdateUserRepoImpl updateUserRepoImpl;
  Future<void> updateUser({
    required String name,
    required String email,
    required String status,
    required int id,
  }) async {
    emit(UpdateUserLoadingState());
    var response = await updateUserRepoImpl.updateUser(
        name: name, email: email, id: id, status: status);
    response.fold((failure) {
      emit(UpdateUserFailureState(failure.errorMessage));
    }, (updatedUser) {
      emit(UpdateUserSuccessfullState());
    });
  }

  Future<void> deleteUser({required int id}) async {
    await updateUserRepoImpl.DeleteUser(id: id).then((value) {
      emit(UsersDeletedSuccessfullState());
    });
  }
}
