import 'package:crud_app/core/utils/api_service.dart';
import 'package:crud_app/features/add_new_user/presentaion/manager/add_new_user_cubit/add_new_user_cubit.dart';

import 'package:crud_app/features/list_view_screen/presentaion/views/list_view_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'features/list_view_screen/data/repos/users_repo_impl.dart';
import 'features/list_view_screen/presentaion/manager/users_list_cubit/users_list_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsersListCubit(
              UsersRepoImpl(ApiService(Dio())), ApiService(Dio()))
            ..FetchUsersList(),
        ),
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
