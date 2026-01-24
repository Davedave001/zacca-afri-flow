# Zacca AI Flutter App Documentation

## Overview
Zacca AI is a comprehensive Flutter application designed for business analytics, loan management, and financial data processing. The app provides a modern, intuitive interface for managing business health scores, loan offers, SDR (Sales Development Representative) vaults, and smart draft inboxes.

## App Architecture

### Project Structure
```
lib/
├── core/
│   └── app_export.dart          # Core app exports and configurations
├── main.dart                     # Main app entry point
├── presentation/                 # UI layer with screens and widgets
│   ├── business_analytics_dashboard/
│   ├── dashboard/
│   ├── loan_offers_screen/
│   ├── sdr_vault/
│   ├── smart_draft_inbox/
│   └── whats_app_import_screen/
├── routes/
│   └── app_routes.dart          # App navigation and routing
├── theme/
│   └── app_theme.dart           # App theming and styling
└── widgets/                      # Reusable UI components
```

## Core Features

### 1. Business Analytics Dashboard
**Location**: `lib/presentation/business_analytics_dashboard/`

The business analytics dashboard provides comprehensive insights into business performance with:
- **Chart Cards**: Visual data representation using charts and graphs
- **Metric Cards**: Key performance indicators and business metrics
- **Export FAB**: Floating action button for data export functionality
- **Time Period Selector**: Customizable time range selection for analytics

**Key Widgets**:
- `ChartCardWidget`: Displays various chart types for data visualization
- `MetricCardWidget`: Shows individual business metrics with styling
- `ExportFabWidget`: Handles data export operations
- `TimePeriodSelectorWidget`: Allows users to select different time periods

### 2. Main Dashboard
**Location**: `lib/presentation/dashboard/`

The main dashboard serves as the app's central hub featuring:
- **Business Health Score**: Overall business performance indicator
- **Quick Actions**: Frequently used app functions
- **Recent Activity**: Latest transactions and updates
- **Sync Status**: Real-time synchronization status indicator

**Key Widgets**:
- `BusinessHealthScoreWidget`: Displays business health metrics
- `QuickActionWidget`: Provides quick access to common functions
- `RecentActivityWidget`: Shows recent app activities
- `SyncStatusWidget`: Indicates data synchronization status

### 3. Loan Offers Screen
**Location**: `lib/presentation/loan_offers_screen/`

Comprehensive loan management interface with:
- **Business Health Header**: Overview of business financial status
- **Loan Offer Cards**: Individual loan offer details and comparisons
- **Application Tracking**: Progress monitoring for loan applications
- **Filter System**: Advanced filtering and sorting capabilities
- **Compare Offers Modal**: Side-by-side loan offer comparison

**Key Widgets**:
- `BusinessHealthHeader`: Business financial overview
- `LoanOfferCard`: Individual loan offer display
- `ApplicationTrackingSection`: Loan application progress tracking
- `CompareOffersModal`: Loan offer comparison interface
- `FilterChips`: Advanced filtering options

### 4. SDR Vault
**Location**: `lib/presentation/sdr_vault/`

Sales Development Representative vault for managing sales data:
- **Transaction Management**: Comprehensive transaction handling
- **Advanced Filtering**: Sophisticated filtering and search capabilities
- **Export Options**: Multiple export formats and options
- **Grouped Views**: Organized transaction displays
- **Context Menus**: Right-click context-sensitive actions

**Key Widgets**:
- `AdvancedFilterPanel`: Advanced filtering interface
- `GroupedTransactionList`: Organized transaction display
- `ExportOptionsSheet`: Export functionality options
- `ContextMenuWidget`: Context-sensitive action menus
- `VaultSummaryCards`: Vault overview and statistics

### 5. Smart Draft Inbox
**Location**: `lib/presentation/smart_draft_inbox/`

Intelligent draft management system featuring:
- **Bulk Actions**: Mass operations on multiple drafts
- **Search Functionality**: Advanced search and filtering
- **Timeline Organization**: Chronological draft organization
- **Transaction Cards**: Individual draft item management

**Key Widgets**:
- `BulkActionBarWidget`: Mass operation controls
- `SearchBarWidget`: Advanced search functionality
- `FilterChipsWidget`: Filtering options
- `TimelineDateSeparatorWidget`: Date-based organization
- `TransactionCardWidget`: Individual draft management

### 6. WhatsApp Import Screen
**Location**: `lib/presentation/whats_app_import_screen/`

WhatsApp data import and processing interface:
- **File Drop Zone**: Drag-and-drop file upload
- **Processing Status**: Real-time import progress tracking
- **Results Preview**: Imported data preview and validation
- **Instruction Steps**: Step-by-step import guidance

**Key Widgets**:
- `FileDropZoneWidget`: File upload interface
- `ProcessingStatusWidget`: Import progress tracking
- `ResultsPreviewWidget`: Data preview and validation
- `InstructionStepsWidget`: Import process guidance

## Technical Implementation

### State Management
The app uses a clean architecture approach with:
- **Presentation Layer**: UI components and screens
- **Business Logic Layer**: Core functionality and data processing
- **Data Layer**: Data sources and repositories

### Navigation
- **App Routes**: Centralized routing configuration in `app_routes.dart`
- **Custom Navigation**: Custom app bar and bottom navigation components

### Theming
- **App Theme**: Consistent styling defined in `app_theme.dart`
- **Custom Widgets**: Reusable UI components in the `widgets/` directory

### Cross-Platform Support
- **Android**: Native Android implementation with Kotlin
- **iOS**: Native iOS implementation with Swift
- **Web**: Flutter web support
- **Responsive Design**: Adaptive layouts for different screen sizes

## Dependencies

### Flutter Dependencies
The app uses standard Flutter packages for:
- **UI Components**: Material Design and Cupertino widgets
- **Navigation**: Flutter routing system
- **State Management**: Provider or Bloc pattern (based on implementation)
- **HTTP Requests**: Network communication
- **Local Storage**: Data persistence

### Platform-Specific Dependencies
- **Android**: Gradle build system with Kotlin support
- **iOS**: CocoaPods with Swift integration
- **Web**: Flutter web compilation

## Development Guidelines

### Code Organization
1. **Feature-based Structure**: Each major feature has its own directory
2. **Widget Separation**: UI components are separated into individual files
3. **Consistent Naming**: Clear, descriptive file and class names
4. **Modular Design**: Reusable components and widgets

### Best Practices
1. **Clean Architecture**: Separation of concerns between layers
2. **Responsive Design**: Support for multiple screen sizes
3. **Accessibility**: Inclusive design considerations
4. **Performance**: Efficient rendering and data handling

## Future Enhancements

### Planned Features
- **Real-time Analytics**: Live data updates and notifications
- **Advanced Reporting**: Comprehensive reporting and export options
- **Integration APIs**: Third-party service integrations
- **Offline Support**: Offline functionality and data synchronization

### Technical Improvements
- **Performance Optimization**: Enhanced rendering and data processing
- **Testing**: Comprehensive unit and integration tests
- **Documentation**: API documentation and developer guides
- **CI/CD**: Automated build and deployment pipelines

## Getting Started

### Prerequisites
- Flutter SDK (latest stable version)
- Dart SDK
- Android Studio / Xcode (for platform-specific development)
- Git for version control

### Setup Instructions
1. Clone the repository
2. Install Flutter dependencies: `flutter pub get`
3. Configure platform-specific settings
4. Run the app: `flutter run`

### Build Instructions
- **Android**: `flutter build apk`
- **iOS**: `flutter build ios`
- **Web**: `flutter build web`

## Support and Contributing

### Development Team
- **Frontend**: Flutter/Dart developers
- **Backend**: API and data processing engineers
- **Design**: UI/UX designers
- **Testing**: Quality assurance team

### Contribution Guidelines
1. Follow the established code structure
2. Maintain consistent coding standards
3. Add appropriate documentation for new features
4. Test thoroughly before submitting changes

---

*This documentation is maintained by the Zacca AI development team and should be updated as the application evolves.*
