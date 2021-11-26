import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/theme/mycolors.dart';
import 'package:konnect/theme/theme.dart';

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
      child: Text(key,style: theme().title18,),
    );
  }

  Widget _value(String value) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 6,
        bottom: 6,
        right: 12,
      ),
      child: Text(value,style: theme().title18p,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('Group List',style: theme().title16w,)),
      body: Container(color: MyColors.iconc,
        child: Center(
          child: Card(
    borderOnForeground: true,

    shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15.0),),
            child: Table(columnWidths: {
              0: FlexColumnWidth(1.0),
              1: FlexColumnWidth(2.0),
            }, children: <TableRow>[
              TableRow(children: [
                _key("NAME:"),
                _value('${_modal.name}'),
              ]),
              TableRow(children: [
                _key("PARENT:"),
                _value('${_modal.parent}'),
              ]),
              TableRow(children: [
                _key("ALIAS:"),
                _value('${_modal.name}'),
              ]),
            ]),
          ),
        ),
      ),
    );
  }
}
