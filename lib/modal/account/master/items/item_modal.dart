import 'dart:convert';

class ItemModal {
  String? guid;
  String? name;
  String? parent;
  StockDetails? stockDetails;
  List<TaxDetails>? taxDetails;

  ItemModal(
      {this.taxDetails, this.parent, this.guid, this.stockDetails, this.name});

  ItemModal.fromJson(Map<String, dynamic>? json) {
    stockDetails = StockDetails.fromJson(json?['STOCKDETAILS']);
    taxDetails = [];
    (json?['TAXDETAILS'] ?? []).forEach((v) {
      taxDetails!.add(TaxDetails.fromJson(v));
    });
    parent = json?['PARENT'] ?? '';
    guid = json?['GUID'] ?? '';
    name = json?['NAME'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.stockDetails != null) {
      data['STOCKDETAILS'] = this.stockDetails!.toJson();
    }
    if (this.taxDetails != null) {
      data['TAXDETAILS'] = this.taxDetails!.map((v) => v.toJson()).toList();
    }
    data['PARENT'] = this.parent;
    data['GUID'] = this.guid;
    data['NAME'] = this.name;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}

class TaxDetails {
  String? gstRateValuationType;
  String? gstRateDutuHead;
  String? gstrate;

  TaxDetails({this.gstRateValuationType, this.gstRateDutuHead, this.gstrate});

  TaxDetails.fromJson(Map<String, dynamic>? json) {
    gstRateValuationType = json?['GSTRATEVALUATIONTYPE'] ?? '';
    gstRateDutuHead = json?['GSTRATEDUTYHEAD'] ?? '';
    gstrate = json?['GSTRATE'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['GSTRATEVALUATIONTYPE'] = this.gstRateValuationType;
    data['GSTRATEDUTYHEAD'] = this.gstRateDutuHead;
    data['GSTRATE'] = this.gstrate;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}

class StockDetails {
  String? hsnCode;
  String? taxAbility;
  String? applicableFrom;

  StockDetails({ this.taxAbility, this.applicableFrom, this.hsnCode});

  StockDetails.fromJson(Map<String, dynamic>? json) {
    applicableFrom = json?['APPLICABLEFROM'] ?? '';
    taxAbility = json?['TAXABILITY'] ?? '';
    hsnCode = json?['HSNCODE'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['APPLICABLEFROM'] = this.applicableFrom;
    data['TAXABILITY'] = this.taxAbility;
    data['HSNCODE'] = this.hsnCode;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
