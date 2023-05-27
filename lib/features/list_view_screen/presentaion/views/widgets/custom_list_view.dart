import 'package:crud_app/core/utils/widgets/custom_error_widget.dart';
import 'package:crud_app/features/list_view_screen/data/repos/users_repo_impl.dart';
import 'package:crud_app/features/list_view_screen/data/repos/users_repo_impl.dart';
import 'package:crud_app/features/list_view_screen/presentaion/manager/users_list_cubit/users_list_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/models/users_model.dart';
import 'list_view_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UsersListCubit, UsersListState>(
        listener: (context, state) => (),
        builder: (context, state) {
          if (state is UsersListSuccesful) {
            return RefreshIndicator(
              onRefresh: () async {
                await UsersListCubit.get(context).FetchUsersList();
              },
              child: Padding(
                padding: EdgeInsets.only(top: 0),
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (
                      context,
                      index,
                    ) =>
                        ListViewItem(
                          index: index,
                          users: users[index],
                          name: users[index].name as String,
                        ),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    itemCount: users.length),
              ),
            );
          } else if (state is UsersListFailure) {
            return CustomErrorWidget(
              errorMessage: state.errorMessage,
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        });
  }
}
