import 'package:crud_app/features/add_new_user/presentaion/views/widgets/custom_text_form_field.dart';
import 'package:crud_app/features/get_all_users/presentaion/manager/users_list_cubit/get_all_users_cubit.dart';
import 'package:crud_app/features/update_user/presentaion/manager/update_user_cubit/update_user_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../../../core/utils/widgets/custom_error_widget.dart';
import '../../../get_all_users/data/models/users_model.dart';
import '../../../get_all_users/data/repos/users_repo_impl.dart';
import '../../../get_all_users/presentaion/views/list_view_screen.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({
    super.key,
    // required this.users,
    required this.index,
  });
  //final UsersModel users;
  final int index;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var statusController = TextEditingController();
  var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllUsersCubit, GetAllUsersState>(
        listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
      emailController.text = users[index].email as String;
      nameController.text = users[index].name as String;
      statusController.text = users[index].status as String;

      return Scaffold(
        appBar: AppBar(
          title: Text('Update User'),
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                        controller: nameController,
                        icon: Icons.person_2_outlined,
                        label: 'Name'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        controller: emailController,
                        icon: Icons.email_outlined,
                        label: 'email'),
                    SizedBox(
                      height: 10,
                    ),
                    CustomTextFormField(
                        controller: statusController,
                        icon: Icons.person_2_outlined,
                        label: 'status'),
                    SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocConsumer<UpdateUserCubit, UpdateUserState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              var cubit = UpdateUserCubit.get(context);
                              return ConditionalBuilder(
                                fallback: (context) =>
                                    Center(child: CircularProgressIndicator()),
                                condition: state is! UpdateUserLoadingState,
                                builder: (context) => MaterialButton(
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                  onPressed: () {
                                    cubit
                                        .updateUser(
                                            name: nameController.text,
                                            email: emailController.text,
                                            status: statusController.text,
                                            id: users[index].id as int)
                                        .then((value) {
                                      GetAllUsersCubit.get(context)
                                          .FetchUsersList();
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                //title: Text('Delete User'),
                                                content: Text(
                                                    'User updated successfuly :)'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      // Navigator.push(
                                                      //     context,
                                                      //     MaterialPageRoute(
                                                      //         builder:
                                                      //             (context) =>
                                                      //                 ListViewScreen()

                                                      //                 )

                                                      //                 );
                                                    },
                                                    child: Text('ok'),
                                                  )
                                                ],
                                              ));
                                    });
                                    // UsersListCubit.get(context).updateUser(
                                    //   name: nameController.text,
                                    //   email: emailController.text,
                                    //   status: statusController.text,
                                    //   id: state.users[index].id as int,
                                    // );
                                  },
                                  child: Text('Update User',
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                  color: Colors.amber,
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          BlocConsumer<UpdateUserCubit, UpdateUserState>(
                            listener: (context, state) {
                              // TODO: implement listener
                            },
                            builder: (context, state) {
                              var cubit = UpdateUserCubit.get(context);
                              return MaterialButton(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            title: Text('Delete User'),
                                            content: Text(
                                                'Are you sure you want to delete this user?'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  // cubit
                                                  //     .deleteUser(
                                                  //         id: users[index].id
                                                  //             as int)
                                                  //     .then((value) {
                                                  //   GetAllUsersCubit.get(
                                                  //           context)
                                                  //       .FetchUsersList();
                                                  //   Navigator.push(
                                                  //       context,
                                                  //       MaterialPageRoute(
                                                  //           builder: (context) =>
                                                  //               ListViewScreen()));
                                                  // }

                                                  // );
                                                  Navigator.pop(context);
                                                },
                                                child: Text('yes'),
                                              )
                                            ],
                                          ));
                                },
                                child: Text('Delete User',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                color: Colors.redAccent,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
