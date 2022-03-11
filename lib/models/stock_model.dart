import 'dart:convert';

class Stock {
  final String id;
  final String stockName;
  final double price;
  final double dayGain;
  final String lastTrade;
  final String extendedHours;
  final double lastPrice;
  Stock({
    required this.id,
    required this.stockName,
    required this.price,
    required this.dayGain,
    required this.lastTrade,
    required this.extendedHours,
    required this.lastPrice,
  });

  Stock copyWith({
    String? id,
    String? stockName,
    double? price,
    double? dayGain,
    String? lastTrade,
    String? extendedHours,
    double? lastPrice,
  }) {
    return Stock(
      id: id ?? this.id,
      stockName: stockName ?? this.stockName,
      price: price ?? this.price,
      dayGain: dayGain ?? this.dayGain,
      lastTrade: lastTrade ?? this.lastTrade,
      extendedHours: extendedHours ?? this.extendedHours,
      lastPrice: lastPrice ?? this.lastPrice,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'stockName': stockName,
      'price': price,
      'dayGain': dayGain,
      'lastTrade': lastTrade,
      'extendedHours': extendedHours,
      'lastPrice': lastPrice,
    };
  }

  factory Stock.fromMap(Map<String, dynamic> map) {
    return Stock(
      id: map['id'] ?? '',
      stockName: map['stockName'] ?? '',
      price: map['price']?.toDouble() ?? 0.0,
      dayGain: map['dayGain']?.toDouble() ?? 0.0,
      lastTrade: map['lastTrade'] ?? '',
      extendedHours: map['extendedHours'] ?? '',
      lastPrice: map['lastPrice']?.toDouble() ?? 0.0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Stock.fromJson(String source) => Stock.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Stock(id: $id, stockName: $stockName, price: $price, dayGain: $dayGain, lastTrade: $lastTrade, extendedHours: $extendedHours, lastPrice: $lastPrice)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stock &&
        other.id == id &&
        other.stockName == stockName &&
        other.price == price &&
        other.dayGain == dayGain &&
        other.lastTrade == lastTrade &&
        other.extendedHours == extendedHours &&
        other.lastPrice == lastPrice;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        stockName.hashCode ^
        price.hashCode ^
        dayGain.hashCode ^
        lastTrade.hashCode ^
        extendedHours.hashCode ^
        lastPrice.hashCode;
  }
}
