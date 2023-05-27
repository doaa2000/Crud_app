// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../features/list_view_screen/data/models/users_model.dart';
// import '../features/list_view_screen/data/repos/users_repo.dart';

// part 'app_state.dart';

// class AppCubit extends Cubit<AppState> {
//   AppCubit(this.usersRepo) : super(AppInitial());

//   final UsersRepo usersRepo;

//   static AppCubit Get(context) => BlocProvider.of(context);

//   Future<void> FetchUsersList() async {
//     emit(UsersListLoading());
//     var result = await usersRepo.fetchUsersList();
//     result.fold(
//       (failure) => emit(UsersListFailure(failure.errorMessage)),
//       (users) => emit(UsersListSuccesful(users)),
//     );
//   }

//   Future<void> AddNewUser(
//       {required String name,
//       required String email,
//       required String gender,
//       required String status}) async {
//     emit(UsersListLoading());
//     var result = await usersRepo.addNewUser(
//       email: name,
//       name: email,
//       gender: gender,
//       status: status,
//     );
//     result.fold(
//       (failure) => emit(AddNewUserFailure(failure.errorMessage)),
//       (users) => emit(AddNewUserSuccesful()),
//     );
//   }
// }
