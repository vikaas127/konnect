import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:konnect/modal/modal.dart';

class AccountDocument {
  final CollectionReference<ItemModal> _itemReference;
  final CollectionReference<GroupModal> groupReference;
  final CollectionReference<LedgerModal> ledgerReference;

  final CollectionReference<StockModal> stockReference;
  final CollectionReference<InvoiceModal> salesReference;
  final CollectionReference<InvoiceModal> receiptReference;
  final CollectionReference<InvoiceModal> paymentReference;
  final CollectionReference<InvoiceModal> purchaseReference;
  final CollectionReference<InvoiceModal> debitNoteReference;
  final CollectionReference<InvoiceModal> creditNoteReference;
  final CollectionReference<StatementModal> statementReference;

  AccountDocument(QueryDocumentSnapshot<CompanyModal> query)
      :
        // Item Master
        _itemReference =
            query.reference.collection('Item Master').withConverter<ItemModal>(
                  fromFirestore: (snapshot, _) =>
                      ItemModal.fromJson(snapshot.data()),
                  toFirestore: (model, _) => model.toJson(),
                ),
        // Groups Master
        groupReference =
            query.reference.collection('Groups').withConverter<GroupModal>(
                  fromFirestore: (snapshot, _) =>
                      GroupModal.fromJson(snapshot.data()),
                  toFirestore: (model, _) => model.toJson(),
                ),
        // Party Master
        ledgerReference =
            query.reference.collection('Ledger').withConverter<LedgerModal>(
                  fromFirestore: (snapshot, _) =>
                      LedgerModal.fromJson(snapshot.data()),
                  toFirestore: (model, _) => model.toJson(),
                ),
        stockReference =
            query.reference.collection('Stock').withConverter<StockModal>(
                  fromFirestore: (snapshot, _) =>
                      StockModal.fromJson(snapshot.data()),
                  toFirestore: (model, _) => model.toJson(),
                ),
        salesReference =
            query.reference.collection('Sales').withConverter<InvoiceModal>(
                  fromFirestore: (snapshot, _) =>
                      InvoiceModal.fromJson(snapshot.data()),
                  toFirestore: (model, _) => model.toJson(),
                ),
        receiptReference =
            query.reference.collection('Receipt').withConverter<InvoiceModal>(
                  fromFirestore: (snapshot, _) =>
                      InvoiceModal.fromJson(snapshot.data()),
                  toFirestore: (model, _) => model.toJson(),
                ),
        paymentReference =
            query.reference.collection('Payment').withConverter<InvoiceModal>(
                  fromFirestore: (snapshot, _) =>
                      InvoiceModal.fromJson(snapshot.data()),
                  toFirestore: (model, _) => model.toJson(),
                ),
        purchaseReference =
            query.reference.collection('Purchase').withConverter<InvoiceModal>(
                  fromFirestore: (snapshot, _) =>
                      InvoiceModal.fromJson(snapshot.data()),
                  toFirestore: (model, _) => model.toJson(),
                ),
        debitNoteReference = query.reference
            .collection('Debit Note')
            .withConverter<InvoiceModal>(
              fromFirestore: (snapshot, _) =>
                  InvoiceModal.fromJson(snapshot.data()),
              toFirestore: (model, _) => model.toJson(),
            ),
        creditNoteReference = query.reference
            .collection('Credit Note')
            .withConverter<InvoiceModal>(
              fromFirestore: (snapshot, _) =>
                  InvoiceModal.fromJson(snapshot.data()),
              toFirestore: (model, _) => model.toJson(),
            ),
        statementReference = query.reference
            .collection('statement')
            .withConverter<StatementModal>(
              fromFirestore: (snapshot, _) =>
                  StatementModal.fromJson(snapshot.data()),
              toFirestore: (model, _) => model.toJson(),
            ) {
    print('Account Document Created ${query.reference.id}');
  }

  Future<LedgerModal?> getLedgerModal(String? ledger) async {
    var path = (ledger ?? '').replaceAll('/', '-');
    var snapshot = await ledgerReference.doc(path).get();
    print('Document Snapshot $path is ${snapshot.exists}');

    return snapshot.exists ? snapshot.data() : null;
  }

  /* ********************************************************** */

  Future<List<ItemModal>> getItems() async {
    var snapshot = await _itemReference.get();
    print('${_itemReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<GroupModal>> getGroups() async {
    var snapshot = await groupReference.get();
    print('${groupReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<LedgerModal>> getLedger() async {
    var snapshot = await ledgerReference.orderBy('NAME').get();
    print('${ledgerReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  /* ********************************************************** */

  Future<List<StockModal>> getStock() async {
    var snapshot = await stockReference.get();
    print('${stockReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<InvoiceModal>> getSales() async {
    var snapshot = await salesReference.get();
    print('${salesReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<InvoiceModal>> getReceipt() async {
    var snapshot = await receiptReference.get();
    print('${receiptReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<InvoiceModal>> getPayment() async {
    var snapshot = await paymentReference.get();
    print('${paymentReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<InvoiceModal>> getPurchase() async {
    var snapshot = await purchaseReference.get();
    print('${purchaseReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<InvoiceModal>> getDebitNote() async {
    var snapshot = await debitNoteReference.get();
    print('${debitNoteReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<InvoiceModal>> getCreditNote() async {
    var snapshot = await creditNoteReference.get();
    print('${creditNoteReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

  Future<List<StatementModal>> getStatement() async {
    var snapshot = await statementReference.get();
    print('${statementReference.id} has ${snapshot.size} document');
    return snapshot.docs.map((element) => element.data()).toList();
  }

/* ********************************************************** */
}
