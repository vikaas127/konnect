import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/theme/mycolors.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
const kSpacingUnit = 10;
const kDarkPrimaryColor = Color(0xFF212121);
const kDarkSecondaryColor = Color(0xFF373737);
const kLightPrimaryColor = Color(0xFFFFFFFF);
const kLightSecondaryColor = Color(0xFFF3F7FB);
const kAccentColor = Color(0xFFFFC107);

final kTitleTextStyle = TextStyle(
 // fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.7),
  fontWeight: FontWeight.w600,
);

final kCaptionTextStyle = TextStyle(
//  fontSize: ScreenUtil().setSp(kSpacingUnit.w * 1.3),
  fontWeight: FontWeight.w100,
);
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

    var profileInfo = Expanded(
      child: Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit * 10,
            width: kSpacingUnit* 10,
            margin: EdgeInsets.only(top: kSpacingUnit * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit * 5,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit * 2.5,
                    width: kSpacingUnit * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit* 1.5,
                      widthFactor: kSpacingUnit * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                      //  size: ScreenUtil().setSp(kSpacingUnit * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit * 2),
          Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit * 0.5),
          Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),
          SizedBox(height: kSpacingUnit * 2),

        ],
      ),
    );


    return Scaffold(
      appBar: AppBar(title: const Text('Ledger View')),
      body:Scaffold(
    body: Column(
    children: <Widget>[
    SizedBox(height: kSpacingUnit* 5),
      Column(
        children: <Widget>[
          Container(
            height: kSpacingUnit * 10,
            width: kSpacingUnit* 10,
            margin: EdgeInsets.only(top: kSpacingUnit * 3),
            child: Stack(
              children: <Widget>[
                CircleAvatar(
                  radius: kSpacingUnit * 5,
                  backgroundImage: AssetImage('assets/images/avatar.png'),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: kSpacingUnit * 2.5,
                    width: kSpacingUnit * 2.5,
                    decoration: BoxDecoration(
                      color: Theme.of(context).accentColor,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      heightFactor: kSpacingUnit* 1.5,
                      widthFactor: kSpacingUnit * 1.5,
                      child: Icon(
                        LineAwesomeIcons.pen,
                        color: kDarkPrimaryColor,
                        //  size: ScreenUtil().setSp(kSpacingUnit * 1.5),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: kSpacingUnit * 2),
          Text(
            'Nicolas Adams',
            style: kTitleTextStyle,
          ),
          SizedBox(height: kSpacingUnit * 0.5),
          Text(
            'nicolasadams@gmail.com',
            style: kCaptionTextStyle,
          ),


        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 28.0),
        child: Table(
            columnWidths: {
          0: FlexColumnWidth(1.0),
          1: FlexColumnWidth(2.0),
        },
            children: <TableRow>[

          TableRow(
              children: [
            _key('Name'),
            _value('${_modal.name}'),
          ]),
          TableRow(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: _key('GSTIN'),
            ),
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
      ),
    ]))

    );
  }
}
