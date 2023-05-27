import 'package:crud_app/features/list_view_screen/data/models/users_model.dart';
import 'package:crud_app/features/user_details/presentaion/views/widgets/row_details_widget.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.users});
  final UsersModel users;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent, title: Text('user Details')),
      body: Column(
        children: [
          Container(
            height: 250,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Material(
                    elevation: 5,
                    child: Container(
                      height: 200,
                      width: double.infinity,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage('assets/images/user.png'),
                  ),
                ),
              ],
            ),
          ),
          Text(users.name as String,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            child: Column(
              children: [
                RowDetailsWidget(
                  icon: Icons.email_outlined,
                  userdata: users.email as String,
                ),
                SizedBox(
                  height: 10,
                ),
                RowDetailsWidget(
                  icon: Icons.person_outline_sharp,
                  userdata: users.gender as String,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
