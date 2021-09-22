import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';

class LedgerViewPage extends StatelessWidget {
  final LedgerModal _modal;

  const LedgerViewPage(
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ledger View')),
      body: Table(columnWidths: {
        0: FlexColumnWidth(1.0),
        1: FlexColumnWidth(2.0),
      }, children: <TableRow>[
        TableRow(children: [
          _key('Name'),
          _value('${_modal.name}'),
        ]),
        TableRow(children: [
          _key('GSTIN'),
          _value('${_modal.partyGstin}'),
        ]),
        TableRow(children: [
          _key('Type'),
          _value('${_modal.gstRegistrationType}'),
        ]),
        TableRow(children: [
          _key('Address'),
          _value('${_modal.address}'),
        ]),
        TableRow(children: [
          _key('State'),
          _value('${_modal.priorStateName}'),
        ]),
        TableRow(children: [
          _key('Country'),
          _value('${_modal.countryName}'),
        ]),
        TableRow(children: [
          _key('Op. Bal.'),
          _value('${_modal.openingBalance}'),
        ]),
        TableRow(children: [
          _key('Cl. Bal.'),
          _value('${_modal.closingBalance}'),
        ]),
      ]),
    );
  }
}
