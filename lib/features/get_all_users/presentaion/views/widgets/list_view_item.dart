import 'package:crud_app/features/get_all_users/presentaion/manager/users_list_cubit/get_all_users_cubit.dart';
import 'package:crud_app/features/update_user/presentaion/views/update_user.dart';
import 'package:crud_app/features/user_details/presentaion/views/details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/users_model.dart';
import '../../../data/repos/users_repo_impl.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(
      {super.key,
      // required this.name,
      required this.usersModel,
      required this.index});
  // final String name;
  final int index;
  final UsersModel usersModel;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllUsersCubit, GetAllUsersState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = GetAllUsersCubit.get(context);
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailsScreen(
                          usersModel: usersModel,
                        )));
          },
          child: Container(
            width: double.infinity,
            child: Row(
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/images/user.png'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Container(
                  width: 90,
                  child: Text('${cubit.usersList[index].name}',
                      //softWrap: true,
                      maxLines: 1,
                      //   textWidthBasis: TextWidthBasis.longestLine,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 17)),
                ),
                Spacer(),
                CircleAvatar(
                    backgroundColor: Colors.amber,
                    radius: 16,
                    child: IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateUser(
                                        //  users: users,
                                        index: index,
                                      )));
                        },
                        icon: Icon(
                          Icons.edit,
                          size: 19,
                          color: Colors.white,
                        ))),
              ],
            ),
          ),
        );
      },
    );
  }
}
