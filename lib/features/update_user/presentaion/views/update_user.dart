import 'package:crud_app/features/add_new_user/presentaion/views/widgets/custom_text_form_field.dart';
import 'package:crud_app/features/list_view_screen/data/models/users_model.dart';
import 'package:crud_app/features/list_view_screen/presentaion/manager/users_list_cubit/users_list_cubit.dart';
import 'package:crud_app/features/list_view_screen/presentaion/views/list_view_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/widgets/custom_error_widget.dart';
import '../../../list_view_screen/data/repos/users_repo_impl.dart';

class UpdateUser extends StatelessWidget {
  UpdateUser({
    super.key,
    required this.users,
    required this.index,
  });
  final UsersModel users;
  final int index;
  var emailController = TextEditingController();
  var nameController = TextEditingController();
  var statusController = TextEditingController();
  var genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersListCubit, UsersListState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if (state is UsersListSuccesful) {
          emailController.text = state.users[index].email as String;
          nameController.text = state.users[index].name as String;
          statusController.text = state.users[index].status as String;

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
                              MaterialButton(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () {
                                  UsersListCubit.get(context).updateUser(
                                    name: nameController.text,
                                    email: emailController.text,
                                    status: statusController.text,
                                    id: state.users[index].id as int,
                                  );
                                  showDialog(
                                      context: context,
                                      builder: (context) => AlertDialog(
                                            //title: Text('Delete User'),
                                            content: Text(
                                                'User updated successfuly :)'),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ListViewScreen()));
                                                },
                                                child: Text('ok'),
                                              )
                                            ],
                                          ));
                                },
                                child: Text('Update User',
                                    style: TextStyle(
                                      color: Colors.white,
                                    )),
                                color: Colors.amber,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MaterialButton(
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
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ListViewScreen()));
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
        } else if (state is UsersListFailure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
