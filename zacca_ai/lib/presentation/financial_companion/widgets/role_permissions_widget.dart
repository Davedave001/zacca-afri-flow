import 'package:flutter/material.dart';

class RolePermissionsWidget extends StatelessWidget {
  const RolePermissionsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.security, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Role & Permissions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'User access control and permissions coming soon',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
