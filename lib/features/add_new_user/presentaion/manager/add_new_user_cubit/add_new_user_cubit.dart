import 'package:bloc/bloc.dart';
import 'package:crud_app/features/list_view_screen/data/models/users_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/utils/api_service.dart';

part 'add_new_user_state.dart';

class AddNewUserCubit extends Cubit<AddNewUserState> {
  AddNewUserCubit(this.apiService) : super(AddNewUserInitial());
  final ApiService apiService;

  static AddNewUserCubit Get(context) => BlocProvider.of(context);
  Future<UsersModel> addNewUser(
      {required String name,
      required String email,
      required String gender,
      required String status}) async {
    Map<String, dynamic> data = await apiService.post(
      endPoint: 'users',
      body: {
        'name': name,
        'email': email,
        'gender': gender,
        'status': status,
      },
    );
    emit(AddNewUserSuccesful());
    return UsersModel.fromJson(data);
  }
}
