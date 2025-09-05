import 'package:flutter/material.dart';

class MultiCurrencyWidget extends StatelessWidget {
  const MultiCurrencyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Multi-Currency Management',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Manage multiple currencies, exchange rates, and currency conversions',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Feature Cards
          _buildFeatureCard(
            'Exchange Rates',
            'Real-time currency exchange rates and historical data',
            Icons.currency_exchange,
            Colors.blue,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureCard(
            'Currency Conversion',
            'Convert amounts between different currencies automatically',
            Icons.swap_horiz,
            Colors.green,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureCard(
            'Multi-Currency Accounts',
            'Manage bank accounts and transactions in multiple currencies',
            Icons.account_balance,
            Colors.purple,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureCard(
            'Currency Reports',
            'Generate reports in different currencies for global operations',
            Icons.assessment,
            Colors.orange,
          ),
          
          const SizedBox(height: 32),
          
          // Coming Soon Message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.blue[200]!),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.construction,
                  size: 48,
                  color: Colors.blue[600],
                ),
                const SizedBox(height: 16),
                Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Multi-currency features are under development and will include:\n'
                  '• Real-time exchange rate updates\n'
                  '• Automated currency conversion\n'
                  '• Multi-currency transaction support\n'
                  '• Currency risk management\n'
                  '• Global financial reporting',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.blue[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeatureCard(String title, String description, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color.withValues(alpha:0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              size: 32,
              color: color,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
