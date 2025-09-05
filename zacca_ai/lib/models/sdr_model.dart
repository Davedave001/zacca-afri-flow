class SDRModel {
  final String id;
  final String buyer;
  final String seller;
  final String product;
  final int quantity;
  final double amount;
  final String status;
  final DateTime date;
  final String chatRef;
  final String? maskedPhone;
  final bool verified;
  final String? pdfUrl;
  final String? blockchainHash;
  final String? mpesaCode;
  final String? bankCode;
  final String? notes;

  SDRModel({
    required this.id,
    required this.buyer,
    required this.seller,
    required this.product,
    required this.quantity,
    required this.amount,
    required this.status,
    required this.date,
    required this.chatRef,
    this.maskedPhone,
    this.verified = false,
    this.pdfUrl,
    this.blockchainHash,
    this.mpesaCode,
    this.bankCode,
    this.notes,
  });

  factory SDRModel.fromJson(Map<String, dynamic> json) {
    return SDRModel(
      id: json['id'] ?? '',
      buyer: json['buyer'] ?? '',
      seller: json['seller'] ?? '',
      product: json['product'] ?? '',
      quantity: json['quantity'] ?? 0,
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? 'Pending Verification',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      chatRef: json['chatRef'] ?? '',
      maskedPhone: json['maskedPhone'],
      verified: json['verified'] ?? false,
      pdfUrl: json['pdfUrl'],
      blockchainHash: json['blockchainHash'],
      mpesaCode: json['mpesaCode'],
      bankCode: json['bankCode'],
      notes: json['notes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buyer': buyer,
      'seller': seller,
      'product': product,
      'quantity': quantity,
      'amount': amount,
      'status': status,
      'date': date.toIso8601String(),
      'chatRef': chatRef,
      'maskedPhone': maskedPhone,
      'verified': verified,
      'pdfUrl': pdfUrl,
      'blockchainHash': blockchainHash,
      'mpesaCode': mpesaCode,
      'bankCode': bankCode,
      'notes': notes,
    };
  }

  SDRModel copyWith({
    String? id,
    String? buyer,
    String? seller,
    String? product,
    int? quantity,
    double? amount,
    String? status,
    DateTime? date,
    String? chatRef,
    String? maskedPhone,
    bool? verified,
    String? pdfUrl,
    String? blockchainHash,
    String? mpesaCode,
    String? bankCode,
    String? notes,
  }) {
    return SDRModel(
      id: id ?? this.id,
      buyer: buyer ?? this.buyer,
      seller: seller ?? this.seller,
      product: product ?? this.product,
      quantity: quantity ?? this.quantity,
      amount: amount ?? this.amount,
      status: status ?? this.status,
      date: date ?? this.date,
      chatRef: chatRef ?? this.chatRef,
      maskedPhone: maskedPhone ?? this.maskedPhone,
      verified: verified ?? this.verified,
      pdfUrl: pdfUrl ?? this.pdfUrl,
      blockchainHash: blockchainHash ?? this.blockchainHash,
      mpesaCode: mpesaCode ?? this.mpesaCode,
      bankCode: bankCode ?? this.bankCode,
      notes: notes ?? this.notes,
    );
  }
}

class SDRItem {
  final String product;
  final int quantity;
  final double price;
  final String? unit;

  SDRItem({
    required this.product,
    required this.quantity,
    required this.price,
    this.unit,
  });

  factory SDRItem.fromJson(Map<String, dynamic> json) {
    return SDRItem(
      product: json['product'] ?? '',
      quantity: json['quantity'] ?? 0,
      price: (json['price'] ?? 0).toDouble(),
      unit: json['unit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product,
      'quantity': quantity,
      'price': price,
      'unit': unit,
    };
  }

  double get subtotal => quantity * price;
}

class ProofModel {
  final String code;
  final String source;
  final double amount;
  final DateTime date;
  final String sender;
  final String receiver;

  ProofModel({
    required this.code,
    required this.source,
    required this.amount,
    required this.date,
    required this.sender,
    required this.receiver,
  });

  factory ProofModel.fromJson(Map<String, dynamic> json) {
    return ProofModel(
      code: json['code'] ?? '',
      source: json['source'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
      sender: json['sender'] ?? '',
      receiver: json['receiver'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'source': source,
      'amount': amount,
      'date': date.toIso8601String(),
      'sender': sender,
      'receiver': receiver,
    };
  }
}

class VBRModel {
  final String id;
  final String buyer;
  final String seller;
  final String product;
  final double amount;
  final String status;
  final DateTime verifiedAt;
  final String hash;
  final String source;
  final String chatRef;
  final String? maskedPhone;

  VBRModel({
    required this.id,
    required this.buyer,
    required this.seller,
    required this.product,
    required this.amount,
    required this.status,
    required this.verifiedAt,
    required this.hash,
    required this.source,
    required this.chatRef,
    this.maskedPhone,
  });

  factory VBRModel.fromJson(Map<String, dynamic> json) {
    return VBRModel(
      id: json['id'] ?? '',
      buyer: json['buyer'] ?? '',
      seller: json['seller'] ?? '',
      product: json['product'] ?? '',
      amount: (json['amount'] ?? 0).toDouble(),
      status: json['status'] ?? 'Verified',
      verifiedAt: DateTime.tryParse(json['verifiedAt'] ?? '') ?? DateTime.now(),
      hash: json['hash'] ?? '',
      source: json['source'] ?? '',
      chatRef: json['chatRef'] ?? '',
      maskedPhone: json['maskedPhone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buyer': buyer,
      'seller': seller,
      'product': product,
      'amount': amount,
      'status': status,
      'verifiedAt': verifiedAt.toIso8601String(),
      'hash': hash,
      'source': source,
      'chatRef': chatRef,
      'maskedPhone': maskedPhone,
    };
  }
}

class WhatsAppMessage {
  final String id;
  final String sender;
  final String content;
  final DateTime timestamp;
  final String? mediaUrl;
  final bool isFromBusiness;

  WhatsAppMessage({
    required this.id,
    required this.sender,
    required this.content,
    required this.timestamp,
    this.mediaUrl,
    this.isFromBusiness = false,
  });

  factory WhatsAppMessage.fromJson(Map<String, dynamic> json) {
    return WhatsAppMessage(
      id: json['id'] ?? '',
      sender: json['sender'] ?? '',
      content: json['content'] ?? '',
      timestamp: DateTime.tryParse(json['timestamp'] ?? '') ?? DateTime.now(),
      mediaUrl: json['mediaUrl'],
      isFromBusiness: json['isFromBusiness'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sender': sender,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'mediaUrl': mediaUrl,
      'isFromBusiness': isFromBusiness,
    };
  }
}
