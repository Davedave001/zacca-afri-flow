import 'dart:convert';
import 'dart:io' if (dart.library.io) 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

import '../../core/app_export.dart';
import '../../widgets/custom_app_bar.dart';
import '../../widgets/custom_bottom_bar.dart';
import './widgets/file_drop_zone_widget.dart';
import './widgets/instruction_steps_widget.dart';
import './widgets/processing_status_widget.dart';
import './widgets/results_preview_widget.dart';
import './widgets/selected_file_card_widget.dart';

class WhatsAppImportScreen extends StatefulWidget {
  const WhatsAppImportScreen({super.key});

  @override
  State<WhatsAppImportScreen> createState() => _WhatsAppImportScreenState();
}

class _WhatsAppImportScreenState extends State<WhatsAppImportScreen>
    with TickerProviderStateMixin {
  // Animation controllers
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  // State variables
  bool _isDragOver = false;
  bool _isBulkImportEnabled = false;
  bool _isProcessing = false;
  bool _showResults = false;
  ProcessingStage _currentStage = ProcessingStage.analyzing;
  double _processingProgress = 0.0;

  // File data
  List<Map<String, dynamic>> _selectedFiles = [];

  // Mock processing data
  final List<Map<String, dynamic>> _mockTransactionData = [
    {
      "id": 1,
      "sender": "John Kamau",
      "message":
          "Hi, I need 50 bags of cement for my construction project. Can you deliver by Friday?",
      "timestamp": DateTime.now().subtract(Duration(hours: 2)),
      "amount": 25000.0,
      "type": "order",
      "confidence": 0.92,
    },
    {
      "id": 2,
      "sender": "Mary Wanjiku",
      "message":
          "Payment of KES 15,000 sent via M-Pesa for the maize delivery. Transaction ID: QH76RT45",
      "timestamp": DateTime.now().subtract(Duration(hours: 5)),
      "amount": 15000.0,
      "type": "payment",
      "confidence": 0.98,
    },
    {
      "id": 3,
      "sender": "Peter Ochieng",
      "message":
          "Can you supply 200kg of sugar for our shop? Need it by Monday morning.",
      "timestamp": DateTime.now().subtract(Duration(days: 1)),
      "amount": 18000.0,
      "type": "inquiry",
      "confidence": 0.85,
    },
    {
      "id": 4,
      "sender": "Grace Muthoni",
      "message":
          "Received the electronics order. Total was KES 45,000. Very satisfied with quality!",
      "timestamp": DateTime.now().subtract(Duration(days: 2)),
      "amount": 45000.0,
      "type": "confirmation",
      "confidence": 0.94,
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _fadeController = AnimationController(
      duration: Duration(milliseconds: 800),
      vsync: this,
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    ));
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  Future<bool> _requestStoragePermission() async {
    if (kIsWeb) return true;

    if (!kIsWeb && Platform.isAndroid) {
      final status = await Permission.storage.request();
      return status.isGranted;
    }
    return true;
  }

  Future<void> _selectFiles() async {
    try {
      final hasPermission = await _requestStoragePermission();
      if (!hasPermission) {
        _showErrorSnackBar('Storage permission is required to select files');
        return;
      }

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['txt'],
        allowMultiple: _isBulkImportEnabled,
      );

      if (result != null) {
        for (var file in result.files) {
          String content = '';

          if (kIsWeb) {
            if (file.bytes != null) {
              content = utf8.decode(file.bytes!);
            }
          } else {
            if (file.path != null) {
              final fileObj = File(file.path!);
              content = await fileObj.readAsString();
            }
          }

          final fileData = {
            'name': file.name,
            'size': _formatFileSize(file.size),
            'content': content,
            'preview': _getPreviewText(content),
          };

          setState(() {
            _selectedFiles.add(fileData);
          });
        }
      }
    } catch (e) {
      _showErrorSnackBar('Error selecting files: Please try again');
    }
  }

  String _formatFileSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  String _getPreviewText(String content) {
    final lines = content.split('\n');
    final previewLines = lines.take(3).toList();
    return previewLines.join('\n');
  }

  void _removeFile(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
  }

  Future<void> _processFiles() async {
    if (_selectedFiles.isEmpty) {
      _showErrorSnackBar('Please select at least one file to process');
      return;
    }

    setState(() {
      _isProcessing = true;
      _currentStage = ProcessingStage.analyzing;
      _processingProgress = 0.0;
    });

    // Simulate AI processing stages
    await _simulateProcessingStage(ProcessingStage.analyzing, 0.3);
    await _simulateProcessingStage(ProcessingStage.extracting, 0.7);
    await _simulateProcessingStage(ProcessingStage.generating, 1.0);

    setState(() {
      _currentStage = ProcessingStage.completed;
      _isProcessing = false;
      _showResults = true;
    });
  }

  Future<void> _simulateProcessingStage(
      ProcessingStage stage, double targetProgress) async {
    setState(() {
      _currentStage = stage;
    });

    // Simulate gradual progress
    while (_processingProgress < targetProgress) {
      await Future.delayed(Duration(milliseconds: 100));
      setState(() {
        _processingProgress += 0.02;
        if (_processingProgress > targetProgress) {
          _processingProgress = targetProgress;
        }
      });
    }

    // Hold at stage for a moment
    await Future.delayed(Duration(milliseconds: 500));
  }

  void _showErrorSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppTheme.getErrorColor(true),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  int _getTransactionCount() {
    return _mockTransactionData.length * _selectedFiles.length;
  }

  double _getConfidenceScore() {
    if (_mockTransactionData.isEmpty) return 0.0;
    final totalConfidence = _mockTransactionData
        .map((transaction) => (transaction['confidence'] as double))
        .reduce((a, b) => a + b);
    return totalConfidence / _mockTransactionData.length;
  }

  String _getEstimatedValue() {
    final totalValue = _mockTransactionData
            .map((transaction) => (transaction['amount'] as double))
            .reduce((a, b) => a + b) *
        _selectedFiles.length;
    return 'KES ${totalValue.toStringAsFixed(0)}';
  }

  void _navigateToReview() {
    Navigator.pushNamed(context, '/smart-draft-inbox');
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      backgroundColor: AppTheme.lightTheme.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: 'Import Chat',
        variant: CustomAppBarVariant.standard,
        leading: IconButton(
          icon: CustomIconWidget(
            iconName: 'close',
            color: colorScheme.onSurface,
            size: 6.w,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: FadeTransition(
        opacity: _fadeAnimation,
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(4.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header section
                Container(
                  width: 90.w,
                  padding: EdgeInsets.all(4.w),
                  child: Column(
                    children: [
                      Container(
                        width: 20.w,
                        height: 20.w,
                        decoration: BoxDecoration(
                          color: AppTheme.lightTheme.colorScheme.primary
                              .withValues(alpha: 0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomIconWidget(
                            iconName: 'chat',
                            color: AppTheme.lightTheme.colorScheme.primary,
                            size: 10.w,
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Text(
                        'Import WhatsApp Chats',
                        style: theme.textTheme.headlineSmall?.copyWith(
                          color: colorScheme.onSurface,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        'Transform your business conversations into structured financial records with AI-powered analysis',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 3.h),

                // Instructions
                InstructionStepsWidget(),

                SizedBox(height: 3.h),

                // Bulk import toggle
                Container(
                  width: 90.w,
                  padding: EdgeInsets.all(4.w),
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: colorScheme.outline.withValues(alpha: 0.2),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    children: [
                      CustomIconWidget(
                        iconName: 'folder_copy',
                        color: AppTheme.lightTheme.colorScheme.secondary,
                        size: 5.w,
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Bulk Import',
                              style: theme.textTheme.titleSmall?.copyWith(
                                color: colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              'Process multiple chat files at once',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Switch(
                        value: _isBulkImportEnabled,
                        onChanged: (value) {
                          setState(() {
                            _isBulkImportEnabled = value;
                          });
                        },
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 3.h),

                // File drop zone
                FileDropZoneWidget(
                  onTap: _selectFiles,
                  isDragOver: _isDragOver,
                  onDragUpdate: (isDragOver) {
                    setState(() {
                      _isDragOver = isDragOver;
                    });
                  },
                ),

                SizedBox(height: 3.h),

                // Selected files
                if (_selectedFiles.isNotEmpty) ...[
                  Container(
                    width: 90.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Selected Files (${_selectedFiles.length})',
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: colorScheme.onSurface,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        ..._selectedFiles.asMap().entries.map((entry) {
                          final index = entry.key;
                          final file = entry.value;
                          return SelectedFileCardWidget(
                            fileName: file['name'],
                            fileSize: file['size'],
                            previewText: file['preview'],
                            onRemove: () => _removeFile(index),
                          );
                        }).toList(),
                      ],
                    ),
                  ),

                  SizedBox(height: 3.h),

                  // Process button
                  Container(
                    width: 90.w,
                    child: ElevatedButton(
                      onPressed: _isProcessing ? null : _processFiles,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            AppTheme.lightTheme.colorScheme.primary,
                        foregroundColor:
                            AppTheme.lightTheme.colorScheme.onPrimary,
                        padding: EdgeInsets.symmetric(vertical: 2.h),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          if (_isProcessing) ...[
                            SizedBox(
                              width: 5.w,
                              height: 5.w,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  AppTheme.lightTheme.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                            SizedBox(width: 3.w),
                          ] else ...[
                            CustomIconWidget(
                              iconName: 'psychology',
                              color: AppTheme.lightTheme.colorScheme.onPrimary,
                              size: 5.w,
                            ),
                            SizedBox(width: 3.w),
                          ],
                          Text(
                            _isProcessing
                                ? 'Processing...'
                                : 'Start AI Processing',
                            style: theme.textTheme.titleMedium?.copyWith(
                              color: AppTheme.lightTheme.colorScheme.onPrimary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 3.h),
                ],

                // Processing status
                if (_isProcessing || _showResults) ...[
                  ProcessingStatusWidget(
                    currentStage: _currentStage,
                    progress: _processingProgress,
                    isVisible: _isProcessing || _showResults,
                  ),
                  SizedBox(height: 3.h),
                ],

                // Results preview
                if (_showResults) ...[
                  ResultsPreviewWidget(
                    transactionCount: _getTransactionCount(),
                    confidenceScore: _getConfidenceScore(),
                    estimatedValue: _getEstimatedValue(),
                    isVisible: _showResults,
                    onReviewTap: _navigateToReview,
                  ),
                  SizedBox(height: 3.h),
                ],

                // Bottom spacing for navigation
                SizedBox(height: 10.h),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomBar(
        currentIndex: 1,
        variant: CustomBottomBarVariant.standard,
        onTap: (index) {
          // Handle navigation through bottom bar
        },
      ),
    );
  }
}
