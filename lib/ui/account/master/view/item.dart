import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';

class ItemViewPage extends StatelessWidget {
  final ItemModal _modal;

  const ItemViewPage(
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
      appBar: AppBar(title: const Text('Item View')),
      body: Table(columnWidths: {
        0: FlexColumnWidth(1.0),
        1: FlexColumnWidth(2.0),
      }, children: <TableRow>[
        TableRow(children: [
          _key('Name'),
          _value('${_modal.name}'),
        ]),
        TableRow(children: [
          _key('Parent'),
          _value('${_modal.parent}'),
        ]),
        TableRow(children: [
          _key('HSN Code'),
          _value('${_modal.stockDetails?.hsnCode}'),
        ]),
        TableRow(children: [
          _key('Tax Ability'),
          _value('${_modal.stockDetails?.taxAbility}'),
        ]),
        ...(_modal.taxDetails ?? []).skip(2).take(1)
            .map(
              (e) => TableRow(children: [
                _key('${e.gstRateDutuHead}'),
                _key('${e.gstrate} %'),
              ]),
            )
            .toList()
      ]),
    );
  }
}
