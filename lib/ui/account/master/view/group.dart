import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';

class GroupViewPage extends StatelessWidget {
  final GroupModal _modal;

  const GroupViewPage(
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
      appBar: AppBar(title: const Text('Group View')),
      body: Table(columnWidths: {
        0: FlexColumnWidth(1.0),
        1: FlexColumnWidth(2.0),
      }, children: <TableRow>[
        TableRow(children: [
          _key('Name'),
          _value('${_modal.name}'),
        ]),
      ]),
    );
  }
}
