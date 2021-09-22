import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:flutter/foundation.dart';
import 'package:provider/provider.dart';

class FirestoreServices {
  final String userId;
  final instance = FirebaseFirestore.instance;

  FirestoreServices(this.userId) {
    if (kIsWeb) instance.enablePersistence();
    else instance.settings = Settings(persistenceEnabled: false);
  }

  Future<List<PeriodsModal>> getCompany() async {
    var document = await instance.collection(userId).doc('Tally').get();

    Map<String, PeriodsModal> _result = Map();
    Map<String, dynamic> _default = {'companyName': []};

    for (var company in (document.data() ?? _default)['companyName']) {
      var snapshot = await document.reference
          .collection(company)
          .withConverter<CompanyModal>(
            fromFirestore: (snapshot, _) =>
                CompanyModal.fromJson(snapshot.data()),
            toFirestore: (model, _) => model.toJson(),
          )
          .get();
      _result[company] = PeriodsModal(snapshot: snapshot.docs);
    }
    return _result.values.toList();
  }

  static FirestoreServices of(BuildContext context){
    return context.read<FirestoreServices>();
  }
}
