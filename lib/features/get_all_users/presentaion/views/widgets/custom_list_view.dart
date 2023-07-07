import 'package:crud_app/core/utils/constants.dart';
import 'package:crud_app/core/utils/widgets/custom_error_widget.dart';
import 'package:crud_app/features/get_all_users/presentaion/manager/users_list_cubit/get_all_users_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import '../../../data/models/users_model.dart';
import '../../../data/repos/users_repo_impl.dart';
import 'list_view_item.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllUsersCubit, GetAllUsersState>(
      listener: (context, index) {},
      builder: (context, index) {
        var cubit = GetAllUsersCubit.get(context);
        return Padding(
          padding: EdgeInsets.only(top: 0),
          child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (
                context,
                index,
              ) =>
                  ListViewItem(
                    index: index,
                    //     users: users[index],
                    //  name: 'ddd' //users[index].name as String,
                  ),
              separatorBuilder: (context, index) => SizedBox(
                    height: 15,
                  ),
              itemCount: cubit.usersList.length),
        );
      },
    );
  }
}
          //   } else if (state is GetAllUsersFailure) {
          //     return CustomErrorWidget(
          //       errorMessage: state.errorMessage,
          //     );
          //   } else {
          //     return Center(child: CircularProgressIndicator());
          //   }
          // }