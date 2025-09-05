class SDRModel {
  final String id;
  final String buyer;
  final String seller;
  final List<SDRItem> items;
  final double total;
  final double paid;
  final String status;
  final DateTime date;
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
    required this.items,
    required this.total,
    required this.paid,
    required this.status,
    required this.date,
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
      items: (json['items'] as List<dynamic>?)
          ?.map((item) => SDRItem.fromJson(item))
          .toList() ?? [],
      total: (json['total'] ?? 0).toDouble(),
      paid: (json['paid'] ?? 0).toDouble(),
      status: json['status'] ?? 'Pending',
      date: DateTime.tryParse(json['date'] ?? '') ?? DateTime.now(),
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
      'items': items.map((item) => item.toJson()).toList(),
      'total': total,
      'paid': paid,
      'status': status,
      'date': date.toIso8601String(),
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
    List<SDRItem>? items,
    double? total,
    double? paid,
    String? status,
    DateTime? date,
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
      items: items ?? this.items,
      total: total ?? this.total,
      paid: paid ?? this.paid,
      status: status ?? this.status,
      date: date ?? this.date,
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
