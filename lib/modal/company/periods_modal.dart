import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konnect/services/account_services.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'company_modal.dart';

class PeriodsModal extends ChangeNotifier {
  int index;
  AccountDocument? _accountDocument;
  List<QueryDocumentSnapshot<CompanyModal>> snapshot;

  PeriodsModal({
    this.index = 0,
    this.snapshot = const [],
  });

  void setSnapshot({
    required int index,
    required List<QueryDocumentSnapshot<CompanyModal>> snapshot,
  }) {
    _accountDocument = AccountDocument(snapshot[index]);
    this.snapshot = snapshot;
    this.index = index;
    notifyListeners();
  }

  int get length => snapshot.length;

  String get id => snapshot[index].id;

  String getId(int index) => snapshot[index].id;

  CompanyModal get single => snapshot[index].data();

  QueryDocumentSnapshot<CompanyModal> get getSnapshot => snapshot[index];

  static PeriodsModal of(BuildContext context) {
    return context.read<PeriodsModal>();
  }

  static PeriodsModal watch(BuildContext context) {
    return context.watch<PeriodsModal>();
  }

  AccountDocument get account => _accountDocument!;
}
