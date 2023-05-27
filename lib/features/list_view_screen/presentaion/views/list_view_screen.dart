import 'package:crud_app/features/add_new_user/presentaion/views/add_new_user_screen.dart';
import 'package:crud_app/features/list_view_screen/presentaion/manager/users_list_cubit/users_list_cubit.dart';
import 'package:crud_app/features/list_view_screen/presentaion/views/widgets/custom_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListViewScreen extends StatelessWidget {
  const ListViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersListCubit, UsersListState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 0, right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: MaterialButton(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddNewUserScreen()));
                      },
                      child: Text('Add New User',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      color: Colors.amber,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text('Users :',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Expanded(child: CustomListView()),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
