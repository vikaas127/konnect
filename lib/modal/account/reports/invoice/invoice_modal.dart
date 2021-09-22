
import 'dart:convert';

class Products {
  String? amount;
  String? stockItemName;

  Products({this.amount, this.stockItemName});

  Products.fromJson(Map<String, dynamic> json) {
    stockItemName = json['STOCKITEMNAME'] ?? '';
    amount = json['AMOUNT'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['STOCKITEMNAME'] = this.stockItemName;
    data['AMOUNT'] = this.amount;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}

class InvoiceModal {
  List<LedgerDetails>? ledgerDetails;
  List<Products>? products;
  String? partyLedgerName;
  String? productTotalAmount;
  String? voucherNumber;
  String? narration;
  String? name;
  String? voucherDate;
  String? vchKey;
  String? reference;
  String? vchType;

  InvoiceModal(
      {this.ledgerDetails,
        this.partyLedgerName,
        this.productTotalAmount,
        this.voucherNumber,
        this.narration,
        this.name,
        this.voucherDate,
        this.products,
        this.vchKey,
        this.reference,
        this.vchType});

  InvoiceModal.fromJson(Map<String, dynamic>? json) {
    ledgerDetails = [];
    products = [];

    (json?['LEDDETAILS'] ?? []).forEach((v) {
      ledgerDetails!.add(LedgerDetails.fromJson(v));
    });
    (json?['PRODUCTS'] ?? []).forEach((v) {
      products!.add(Products.fromJson(v));
    });
    partyLedgerName = json?['PARTYLEDGERNAME'] ?? '';
    productTotalAmount = '${json?['PRODUCTTOTALAMOUNT']}';
    voucherNumber = json?['VOUCHERNUMBER'] ?? '';
    narration = json?['NARRATION'] ?? '';
    name = json?['NAME'] ?? '';
    voucherDate = json?['VOUCHERDATE'] ?? '';

    vchKey = json?['VCHKEY'] ?? '';
    reference = json?['REFERENCE'] ?? '';
    vchType = json?['VCHTYPE'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (this.ledgerDetails != null) {
      data['LEDDETAILS'] = this.ledgerDetails!.map((v) => v.toJson()).toList();
    }
    data['PARTYLEDGERNAME'] = this.partyLedgerName;
    data['PRODUCTTOTALAMOUNT'] = this.productTotalAmount;
    data['VOUCHERNUMBER'] = this.voucherNumber;
    data['NARRATION'] = this.narration;
    data['NAME'] = this.name;

    data['VOUCHERDATE'] = this.voucherDate;
    if (this.products != null) {
      data['PRODUCTS'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['VCHKEY'] = this.vchKey;
    data['REFERENCE'] = this.reference;
    data['VCHTYPE'] = this.vchType;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}

class LedgerDetails {
  String? amount;
  String? ledgerName;
  String? vatExpAmount;

  LedgerDetails({this.ledgerName, this.amount, this.vatExpAmount});

  LedgerDetails.fromJson(Map<String, dynamic> json) {
    vatExpAmount = json['VATEXPAMOUNT'] ?? '';
    ledgerName = json['LEDGERNAME'] ?? '';
    amount = json['AMOUNT'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['VATEXPAMOUNT'] = this.vatExpAmount;
    data['LEDGERNAME'] = this.ledgerName;
    data['AMOUNT'] = this.amount;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
