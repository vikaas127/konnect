class CompanyModal {
  String? name;
  String? email;
  String? gstin;
  String? address;
  String? pinCode;
  String? stateName;
  String? booksFrom;
  String? countryName;
  String? startingFrom;
  String? openingBalance;
  String? closingBalance;
  bool? exportToCloud;

  CompanyModal({
    String? name,
    String? gstin,
    String? email,
    String? address,
    String? pinCode,
    String? booksFrom,
    String? stateName,
    String? countryName,
    String? startingFrom,
    String? closingBalance,
    String? openingBalance,
    bool? exportToCloud,
  }) {
    this.openingBalance = openingBalance;
    this.closingBalance = closingBalance;
    this.exportToCloud = exportToCloud;
    this.startingFrom = startingFrom;
    this.countryName = countryName;
    this.stateName = stateName;
    this.booksFrom = booksFrom;
    this.address = address;
    this.pinCode = pinCode;
    this.gstin = gstin;
    this.email = email;
    this.name = name;
  }

  String get getAddress => '$address $stateName $countryName, $pinCode.';

  CompanyModal.fromJson(Map<String?, dynamic>? json) {
    openingBalance = json?['OPENINGBALANCE'] ?? '';
    closingBalance = json?['CLOSINGBALANCE'] ?? '';
    exportToCloud = json?['EXPORTTOCLOUD'] ?? false;
    startingFrom = json?['STARTINGFROM'] ?? '';
    countryName = json?['COUNTRYNAME'] ?? '';
    booksFrom = json?['BOOKSFROM'] ?? '';
    stateName = json?['STATENAME'] ?? '';
    address = json?['ADDRESS'] ?? '';
    pinCode = json?['PINCODE'] ?? '';
    gstin = json?['GSTIN'] ?? '';
    email = json?['EMAIL'] ?? '';
    name = json?['NAME'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OPENINGBALANCE'] = this.openingBalance;
    data['CLOSINGBALANCE'] = this.closingBalance;
    data['EXPORTTOCLOUD'] = this.exportToCloud;
    data['STARTINGFROM'] = this.startingFrom;
    data['COUNTRYNAME'] = this.countryName;
    data['BOOKSFROM'] = this.booksFrom;
    data['STATENAME'] = this.stateName;
    data['ADDRESS'] = this.address;
    data['PINCODE'] = this.pinCode;
    data['GSTIN'] = this.gstin;
    data['EMAIL'] = this.email;
    data['NAME'] = this.name;
    return data;
  }
}
