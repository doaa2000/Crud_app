import 'package:flutter/material.dart';

class RowDetailsWidget extends StatelessWidget {
  RowDetailsWidget({super.key, required this.userdata, required this.icon});

  final IconData icon;
  final String userdata;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 0),
      child: Row(
        children: [
          Icon(icon),
          SizedBox(
            width: 10,
          ),
          Text(userdata),
        ],
      ),
    );
  }
}
