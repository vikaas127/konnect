import 'dart:convert';

class LedgerModal {
  String? gstRegistrationType;
  String? openingBalance;
  String? ledStateName;
  String? partyGstin;
  String? priorStateName;
  String? mailingName;
  String? name;
  String? parent;
  String? address;
  String? closingBalance;
  String? isEBankingEnabled;
  String? countryName;

  LedgerModal({
    this.gstRegistrationType,
    this.openingBalance,
    this.ledStateName,
    this.partyGstin,
    this.priorStateName,
    this.mailingName,
    this.name,
    this.parent,
    this.address,
    this.closingBalance,
    this.isEBankingEnabled,
    this.countryName,
  });

  LedgerModal.fromJson(Map<String, dynamic>? json) {
    gstRegistrationType = json?['GSTREGISTRATIONTYPE'] ?? '';
    openingBalance = json?['OPENINGBALANCE'] ?? '';
    ledStateName = json?['LEDSTATENAME'] ?? '';
    partyGstin = json?['PARTYGSTIN'] ?? '';
    priorStateName = json?['PRIORSTATENAME'] ?? '';
    mailingName = json?['MAILINGNAME'] ?? '';
    name = json?['NAME'] ?? '';
    parent = json?['PARENT'] ?? '';
    address = json?['ADDRESS'] ?? '';
    closingBalance = json?['CLOSINGBALANCE'];
    isEBankingEnabled = json?['ISEBANKINGENABLED'] ?? '';
    countryName = json?['COUNTRYNAME'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['GSTREGISTRATIONTYPE'] = this.gstRegistrationType;
    data['OPENINGBALANCE'] = this.openingBalance;
    data['LEDSTATENAME'] = this.ledStateName;
    data['PARTYGSTIN'] = this.partyGstin;
    data['PRIORSTATENAME'] = this.priorStateName;
    data['MAILINGNAME'] = this.mailingName;
    data['NAME'] = this.name;
    data['PARENT'] = this.parent;
    data['ADDRESS'] = this.address;
    data['EXPORTTOCLOUD'] = this.closingBalance;
    data['CLOSINGBALANCE'] = this.isEBankingEnabled;
    data['ISEBANKINGENABLED'] = this.isEBankingEnabled;
    data['COUNTRYNAME'] = this.countryName;
    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
