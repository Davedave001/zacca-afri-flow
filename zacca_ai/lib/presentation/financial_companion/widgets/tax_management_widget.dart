import 'package:flutter/material.dart';

class TaxManagementWidget extends StatelessWidget {
  const TaxManagementWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Text(
            'Tax & GST Management',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white, // White text for header
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Comprehensive tax management including GST, VAT, and compliance reporting',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white, // White text for accompanying text
            ),
          ),
          
          const SizedBox(height: 32),
          
          // Feature Cards
          _buildFeatureCard(
            'GST/VAT Calculation',
            'Automated tax calculations and rate management',
            Icons.calculate,
            Colors.green,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureCard(
            'Tax Filing',
            'Prepare and submit tax returns with compliance tracking',
            Icons.description,
            Colors.blue,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureCard(
            'Tax Reports',
            'Generate comprehensive tax reports and analytics',
            Icons.assessment,
            Colors.purple,
          ),
          
          const SizedBox(height: 16),
          
          _buildFeatureCard(
            'Compliance Tracking',
            'Monitor tax deadlines and compliance requirements',
            Icons.track_changes,
            Colors.orange,
          ),
          
          const SizedBox(height: 32),
          
          // Coming Soon Message
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.green[50],
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.green[200]!),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.construction,
                  size: 48,
                  color: Colors.green[600],
                ),
                const SizedBox(height: 16),
                Text(
                  'Coming Soon',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green[700],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Tax management features are under development and will include:\n'
                  '• Automated GST/VAT calculations\n'
                  '• Tax return preparation\n'
                  '• Compliance deadline tracking\n'
                  '• Multi-jurisdiction tax support\n'
                  '• Tax audit trail and documentation',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.green[600],
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
