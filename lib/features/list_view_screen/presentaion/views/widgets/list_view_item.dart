import 'package:crud_app/features/list_view_screen/data/models/users_model.dart';
import 'package:crud_app/features/update_user/presentaion/views/update_user.dart';
import 'package:crud_app/features/user_details/presentaion/views/details_screen.dart';
import 'package:flutter/material.dart';

import '../../../data/repos/users_repo_impl.dart';

class ListViewItem extends StatelessWidget {
  const ListViewItem(
      {super.key,
      required this.name,
      required this.users,
      required this.index});
  final String name;
  final int index;
  final UsersModel users;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsScreen(
                      users: users,
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
            Text(name,
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 17)),
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
                                    users: users,
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
  }
}
