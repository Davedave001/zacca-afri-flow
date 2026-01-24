import 'package:flutter/material.dart';

class ChartOfAccountsWidget extends StatelessWidget {
  const ChartOfAccountsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.account_tree, size: 64, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Chart of Accounts',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Unlimited account management coming soon',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
