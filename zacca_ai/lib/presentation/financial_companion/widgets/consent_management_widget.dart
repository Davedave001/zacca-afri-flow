import 'package:flutter/material.dart';

class ConsentManagementWidget extends StatelessWidget {
  const ConsentManagementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.privacy_tip, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Consent Management',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Data privacy and consent tracking coming soon',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
