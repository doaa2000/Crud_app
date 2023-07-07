import 'package:crud_app/features/add_new_user/data/repos/add_user_repo_impl.dart';
import 'package:crud_app/features/add_new_user/presentaion/manager/add_new_user_cubit/add_new_user_cubit.dart';
import 'package:crud_app/features/get_all_users/data/repos/users_repo_impl.dart';
import 'package:crud_app/features/get_all_users/presentaion/manager/users_list_cubit/get_all_users_cubit.dart';
import 'package:crud_app/features/update_user/data/repos/update_user_repo_impl.dart';
import 'package:crud_app/features/update_user/presentaion/manager/update_user_cubit/update_user_cubit.dart';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/utils/services/api_services.dart';
import 'features/get_all_users/presentaion/views/list_view_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MultiBlocProvider(
    //   providers: [
    //     // BlocProvider(
    //     //   create: (context) => GetAllUsersCubit(UsersRepoImpl(ApiService(Dio())), ApiService(Dio()))..FetchUsersList(),
    //     // ),
    //   ],
    //   child:
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                GetAllUsersCubit(UsersRepoImpl(ApiService(Dio())))
                  ..FetchUsersList()),
        BlocProvider(
            create: ((context) =>
                AddNewUserCubit(AddNewUserRepoImpl(ApiService(Dio()))))),
        BlocProvider(
            create: (context) =>
                UpdateUserCubit(UpdateUserRepoImpl(ApiService(Dio())))),
      ],
      child: MaterialApp(
        theme: ThemeData(
            appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.transparent,
          elevation: 0,
        )),
        debugShowCheckedModeBanner: false,
        home: ListViewScreen(),
      ),
    );
  }
}
