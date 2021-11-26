
import 'dart:convert';
class Products {
  String? actualQty;
  String? amount;
  String? billedqty;
  String? rate;
  String? stockItemName;

  Products({this.amount, this.stockItemName,this.rate,this.actualQty,this.billedqty});

  Products.fromJson(Map<String, dynamic> json) {
    stockItemName = json['STOCKITEMNAME'] ?? '';
    amount = json['AMOUNT'] ?? '';
    rate = json['RATE'] ?? '';
    actualQty = json['ACTUALQTY'] ?? '';
    billedqty = json['BILLEDQTY'] ?? '';

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['STOCKITEMNAME'] = this.stockItemName;
    data['AMOUNT'] = this.amount;
    data['ACTUALQTY']= this.actualQty;
    data['BILLEDDAY']= this.billedqty;
    data['RATE']= this.rate;
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
  String? Totalamount;
  bool?exporttocloud;

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
        this.vchType,
        this.Totalamount,
        this.exporttocloud,
        });

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
   exporttocloud=json?['EXPORTTOCLOUD'];
   Totalamount=json?['TOTALAMOUNT'];
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
    data['EXPORTTOCLOUD'] = this.exporttocloud;
    data['TOTALAMOUNT'] = this.Totalamount;
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
