import 'dart:convert';

class StatementModal {
  String? name;

  Map<String, dynamic>? json;

  StatementModal({
    String? name,
  }) {
    this.name = name;
  }

  StatementModal.fromJson(Map<String, dynamic>? json) {
    name = json?['NAME'] ?? '';
    this.json = json;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    return json ?? data;
  }

  @override
  String toString() => jsonEncode(toJson());
}