import 'dart:convert';

class GroupModal {
  String? name;
  String? parent;

  GroupModal({
    this.name,
    this.parent,
  });

  GroupModal.fromJson(Map<String, dynamic>? json) {
    parent = json?['PARENT'] ?? '';
    name = json?['NAME'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['PARENT'] = this.parent;
    data['NAME'] = this.name;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
