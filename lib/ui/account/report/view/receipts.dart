import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:konnect/modal/modal.dart';

class ReceiptsViewPage extends StatelessWidget {
  final InvoiceModal _modal;

  const ReceiptsViewPage(
    this._modal, {
    Key? key,
  }) : super(key: key);

  Widget _key(String key) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        top: 6,
        bottom: 6,
      ),
      child: Text(key),
    );
  }

  Widget _value(String value) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
        bottom: 6,
        right: 12,
      ),
      child: Text(value),
    );
  }

  String dateFormat(String date) {
    if (date.isEmpty) return '';
    var inputDate = DateTime.parse(date);
    return DateFormat('dd MMMM yyyy').format(inputDate);
  }

  bool isEqual(e) => e.ledgerName == _modal.partyLedgerName;

  @override
  Widget build(BuildContext context) {
    PeriodsModal periods = PeriodsModal.of(context);
    var _list = _modal.ledgerDetails ?? [];
    var _name = _modal.partyLedgerName;
    return Scaffold(
      appBar: AppBar(title: Text('Receipts View')),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          FutureBuilder<LedgerModal?>(
            future: periods.account.getLedgerModal(_name),
            builder: (_, AsyncSnapshot<LedgerModal?> snapshot) {
              LedgerModal? _ledger = snapshot.data;
              return Table(
                columnWidths: {
                  0: FlexColumnWidth(1.0),
                  1: FlexColumnWidth(2.0),
                },
                children: [
                  TableRow(children: [
                    _key('Name'),
                    _value('$_name'),
                  ]),
                  TableRow(children: [
                    _key('GSTIN'),
                    _value('${_ledger?.partyGstin ?? '...'}'),
                  ]),
                  TableRow(children: [
                    _key('Address'),
                    _value('${_ledger?.address ?? '...'}'),
                  ]),
                  TableRow(children: [
                    _key('State'),
                    _value('${_ledger?.priorStateName ?? '...'}'),
                  ]),
                  TableRow(children: [
                    _key('Country'),
                    _value('${_ledger?.countryName ?? '...'}'),
                  ]),
                  TableRow(children: [
                    _key('voucher no.'),
                    _value('${_modal.voucherNumber}'),
                  ]),
                  TableRow(children: [
                    _key('voucher date'),
                    _value(dateFormat('${_modal.voucherDate}')),
                  ]),
                ],
              );
            },
          ),
          SizedBox(height: 36),
          Table(
            columnWidths: {
              0: FlexColumnWidth(2.0),
              1: FlexColumnWidth(1.0),
            },
            children: [
              ..._list
                  .skipWhile(isEqual)
                  .map((e) => TableRow(children: [
                        _key('${e.ledgerName}'),
                        _value('${e.amount}'),
                      ]))
                  .toList(),
              TableRow(children: [
                _key('Total Amount'),
                _value('${_list.firstWhere(isEqual).amount}'),
              ]),
            ],
          ),
          SizedBox(height: 36),
          Text('${_modal.narration}'),
        ],
      ),
    );
  }
}
