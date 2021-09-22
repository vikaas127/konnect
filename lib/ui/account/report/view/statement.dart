import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';

class StatementViewPage extends StatelessWidget {
  final StatementModal _modal;

  const StatementViewPage(
      this._modal, {
        Key? key,
      }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    PeriodsModal services = PeriodsModal.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Statement View')),
      body: Container(),
    );
  }
}
