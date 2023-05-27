import 'package:crud_app/features/add_new_user/presentaion/manager/add_new_user_cubit/add_new_user_cubit.dart';
import 'package:crud_app/features/add_new_user/presentaion/views/widgets/custom_text_form_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/api_service.dart';
import '../../../list_view_screen/data/repos/users_repo_impl.dart';

class AddNewUserScreen extends StatelessWidget {
  AddNewUserScreen({super.key});
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var statusController = TextEditingController();
  var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          titleSpacing: 0,
          title: Text(
            'Create new user',
          ),
        ),
        body: BlocProvider(
            create: (context) => AddNewUserCubit(ApiService(Dio())),
            child: BlocConsumer<AddNewUserCubit, AddNewUserState>(
              listener: (context, state) => {},
              builder: (context, state) {
                return Center(
                    child: SingleChildScrollView(
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomTextFormField(
                              controller: nameController,
                              label: 'Name',
                              icon: Icons.person_4_outlined,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: emailController,
                              label: 'Emai Address',
                              icon: Icons.email_outlined,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: statusController,
                              label: 'Status',
                              icon: Icons.add_reaction_outlined,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            CustomTextFormField(
                              controller: genderController,
                              label: 'Gender',
                              icon: Icons.person_2_outlined,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: double.infinity,
                              child: MaterialButton(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                onPressed: () {
                                  AddNewUserCubit.Get(context).addNewUser(
                                      name: nameController.text,
                                      email: emailController.text,
                                      gender: genderController.text,
                                      status: statusController.text);
                                },
                                child: Text('Add User',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                color: Colors.amber,
                              ),
                            ),
                          ]),
                    ),
                  ),
                ));
              },
            )));
  }
}
