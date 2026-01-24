import 'package:flutter/material.dart';
import '../presentation/smart_draft_inbox/smart_draft_inbox.dart';
import '../presentation/dashboard/dashboard.dart';
import '../presentation/loan_offers_screen/loan_offers_screen.dart';
import '../presentation/business_analytics_dashboard/business_analytics_dashboard.dart';
import '../presentation/sdr_vault/sdr_vault.dart';
import '../presentation/whats_app_import_screen/whats_app_import_screen.dart';
import '../presentation/financial_companion/financial_companion.dart';

class AppRoutes {
  // TODO: Add your routes here
  static const String initial = '/';
  static const String smartDraftInbox = '/smart-draft-inbox';
  static const String home = '/dashboard';
  static const String loanOffers = '/loan-offers-screen';
  static const String businessAnalyticsDashboard =
      '/business-analytics-dashboard';
  static const String sdrVault = '/sdr-vault';
  static const String whatsAppImport = '/whats-app-import-screen';
  static const String financialCompanion = '/financial-companion';

  static Map<String, WidgetBuilder> routes = {
    initial: (context) => const SmartDraftInbox(),
    smartDraftInbox: (context) => const SmartDraftInbox(),
    home: (context) => const Dashboard(),
    loanOffers: (context) => const LoanOffersScreen(),
    businessAnalyticsDashboard: (context) => const BusinessAnalyticsDashboard(),
    sdrVault: (context) => const SdrVault(),
    whatsAppImport: (context) => const WhatsAppImportScreen(),
    financialCompanion: (context) => const FinancialCompanion(),
    // TODO: Add your other routes here
  };
}
