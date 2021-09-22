import 'dart:convert';

class StockModal {
  String? name;

  Map<String, dynamic>? json;

  StockModal({
    String? name,
  }) {
    this.name = name;
  }

  StockModal.fromJson(Map<String, dynamic>? json) {
    this.json = json;
    name = json?['NAME'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    return json ?? data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
