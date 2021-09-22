import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';

class StockViewPage extends StatelessWidget {
  final StockModal _modal;

  const StockViewPage(
    this._modal, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PeriodsModal services = PeriodsModal.of(context);
    return Scaffold(
      appBar: AppBar(title: const Text('Stock View')),
      body: Container(),
    );
  }
}
