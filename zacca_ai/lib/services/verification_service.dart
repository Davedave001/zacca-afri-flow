import 'dart:convert';
import 'dart:math';
import '../models/sdr_model.dart';

class VerificationService {
  static const int _toleranceMinutes = 30;

  /// Verifies an SDR against a proof of payment
  static VerificationResult verifySDR(SDRModel sdr, ProofModel proof) {
    // Check amount match
    final amountMatch = (sdr.amount - proof.amount).abs() < 0.01;
    
    // Check time tolerance (±30 minutes)
    final timeDifference = sdr.date.difference(proof.date).abs();
    final timeMatch = timeDifference.inMinutes <= _toleranceMinutes;
    
    // Check sender/receiver alignment (simplified check)
    final senderMatch = _checkSenderAlignment(sdr, proof);
    
    // Overall verification
    final isVerified = amountMatch && timeMatch && senderMatch;
    
    return VerificationResult(
      isVerified: isVerified,
      amountMatch: amountMatch,
      timeMatch: timeMatch,
      senderMatch: senderMatch,
      timeDifference: timeDifference,
      amountDifference: (sdr.amount - proof.amount).abs(),
    );
  }

  /// Generates a simulated blockchain hash
  static String generateBlockchainHash(SDRModel sdr, ProofModel proof) {
    final data = {
      'sdrId': sdr.id,
      'buyer': sdr.buyer,
      'amount': sdr.amount,
      'proofCode': proof.code,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    };
    
    final jsonString = jsonEncode(data);
    final bytes = utf8.encode(jsonString);
    
    // Simulate SHA256 hash (simplified)
    final hash = _simulateSHA256(bytes);
    return '0x$hash';
  }

  /// Converts SDR to VBR after verification
  static VBRModel convertToVBR(SDRModel sdr, ProofModel proof) {
    final hash = generateBlockchainHash(sdr, proof);
    
    return VBRModel(
      id: sdr.id,
      buyer: sdr.buyer,
      seller: sdr.seller,
      product: sdr.product,
      amount: sdr.amount,
      status: 'Verified',
      verifiedAt: DateTime.now(),
      hash: hash,
      source: proof.source,
      chatRef: sdr.chatRef,
      maskedPhone: sdr.maskedPhone,
    );
  }

  /// Checks if sender/receiver alignment makes sense
  static bool _checkSenderAlignment(SDRModel sdr, ProofModel proof) {
    // Simplified logic - in real implementation, this would be more sophisticated
    // For now, just check if the proof sender matches the expected pattern
    return proof.sender.isNotEmpty && proof.receiver.isNotEmpty;
  }

  /// Simulates SHA256 hash generation
  static String _simulateSHA256(List<int> bytes) {
    final random = Random();
    final hash = StringBuffer();
    
    for (int i = 0; i < 64; i++) {
      hash.write(random.nextInt(16).toRadixString(16));
    }
    
    return hash.toString();
  }
}

class VerificationResult {
  final bool isVerified;
  final bool amountMatch;
  final bool timeMatch;
  final bool senderMatch;
  final Duration timeDifference;
  final double amountDifference;

  VerificationResult({
    required this.isVerified,
    required this.amountMatch,
    required this.timeMatch,
    required this.senderMatch,
    required this.timeDifference,
    required this.amountDifference,
  });

  String get statusMessage {
    if (isVerified) {
      return 'Transaction verified successfully!';
    }
    
    final issues = <String>[];
    if (!amountMatch) {
      issues.add('Amount mismatch (${amountDifference.toStringAsFixed(2)} KES)');
    }
    if (!timeMatch) {
      issues.add('Time difference too large (${timeDifference.inMinutes} minutes)');
    }
    if (!senderMatch) {
      issues.add('Sender/receiver mismatch');
    }
    
    return 'Verification failed: ${issues.join(', ')}';
  }
}
