import 'package:flutter/material.dart';

class RevenueRecognitionWidget extends StatelessWidget {
  const RevenueRecognitionWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.trending_up, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Revenue Recognition',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Revenue recognition and accounting compliance coming soon',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
