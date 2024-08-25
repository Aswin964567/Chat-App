import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String name;
  final void Function()? onTap;

  const UserTile({super.key, required this.name, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: MediaQuery.of(context).size.width * 0.02,
        horizontal: MediaQuery.of(context).size.width * 0.04,
      ),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: ListTile(
          contentPadding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * 0.05,
              vertical: MediaQuery.of(context).size.width * 0.05),
          leading: CircleAvatar(
            radius: MediaQuery.of(context).size.width *
                0.1, // Responsive avatar size
            backgroundColor: Colors.white,
            child: const Icon(
              Icons.person,
              color: Colors.black,
              size: 24, // Fixed size icon to maintain consistency
            ),
          ),
          title: Text(
            name,
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.width *
                  0.04, // Responsive text size
            ),
          ),
          onTap: onTap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          tileColor: Colors.grey[350],
          visualDensity: VisualDensity.compact,
        ),
      ),
    );
  }
}
