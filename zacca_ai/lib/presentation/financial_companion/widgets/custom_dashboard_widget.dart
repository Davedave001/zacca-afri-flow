import 'package:flutter/material.dart';

class CustomDashboardWidget extends StatelessWidget {
  const CustomDashboardWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.dashboard_customize, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Custom Dashboards',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Personalized financial dashboards coming soon',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
