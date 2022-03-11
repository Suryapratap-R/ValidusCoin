import 'dart:convert';
import 'package:flutter/foundation.dart';

import 'stock_model.dart';

class Stocks {
  final bool success;
  final int statusCode;
  final List<Stock> data;
  Stocks({
    required this.success,
    required this.statusCode,
    required this.data,
  });
  

  Stocks copyWith({
    bool? success,
    int? statusCode,
    List<Stock>? data,
  }) {
    return Stocks(
        success: success ?? this.success,
        statusCode: statusCode ?? this.statusCode,
        data: data ?? this.data);
  }

  Map<String, dynamic> toMap() {
    return {
      'success': success,
      'statusCode': statusCode,
      'data': data.map((x) => x.toMap()).toList(),
    };
  }

  factory Stocks.fromMap(Map<String, dynamic> map) {
    return Stocks(
      success: map['success'] ?? false,
      statusCode: map['statusCode']?.toInt() ?? 0,
      data: List<Stock>.from(map['data']?.map((x) => Stock.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Stocks.fromJson(String source) => Stocks.fromMap(json.decode(source));

  @override
  String toString() =>
      'Stocks(success: $success, statusCode: $statusCode, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Stocks &&
        other.success == success &&
        other.statusCode == statusCode &&
        listEquals(other.data, data);
  }

  @override
  int get hashCode => success.hashCode ^ statusCode.hashCode ^ data.hashCode;
}
