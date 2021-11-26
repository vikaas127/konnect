import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/theme/theme.dart';
import 'package:konnect/ui/account/pdfview/PaymentsInvoice.dart';
import 'package:konnect/ui/account/pdfview/SalesInvoicerpdf.dart';

class PaymentsViewPage extends StatefulWidget {
  final InvoiceModal _modal;

  const PaymentsViewPage(
    this._modal, {
    Key? key,
  }) : super(key: key);

 /* Widget _key(String key) {
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
      appBar: AppBar(title: Text('Payments View')),
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
  }*/

  @override
  State<StatefulWidget> createState() {
    return PaymentsViewPage_state();
  }
}
class PaymentsViewPage_state extends State<PaymentsViewPage> {

  late DataTable dataTable;

  @override
  void initState() {
    super.initState();


  }
  DataCell getDataCell12(String value) {
    try {
      return DataCell(
        Text(
          value,
          style: GoogleFonts.lato(fontSize: 18, color: Colors.black54),
        ),
      );
    } catch (e) {
      return DataCell(
        Text(
          ' ',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      );
    }
  }
  DataCell getDataCell(List<String> list, int pos) {
    try {
      return DataCell(
        Text(
          list[pos],
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      );
    } catch (e) {
      return DataCell(
        Text(
          ' ',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      );
    }
  }
  Widget getRowDesign(String? text, double fontSize) {
    return Padding(
      padding: EdgeInsets.only(top: 3, bottom: 3),
      child: Text(
        text!,
        style: GoogleFonts.lato(
            fontSize: fontSize,
            color: Colors.black,
            fontWeight: FontWeight.bold),
      ),
    );
  }
  DataCell getDataCell1(List<String> list, int pos, String spc) {
    try {
      return DataCell(
        Text(
          spc + '' + list[pos],
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      );
    } catch (e) {
      return DataCell(
        Text(
          ' ',
          style: TextStyle(fontSize: 18, color: Colors.black54),
        ),
      );
    }
  }
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

  bool isEqual(e) => e.ledgerName == widget._modal.partyLedgerName;

  @override
  Widget build(BuildContext context) {
    PeriodsModal periods = PeriodsModal.watch(context);
    CompanyModal company = periods.single;
    var _list =widget._modal.ledgerDetails ?? [];
    var _product =widget._modal.products ?? [];
    var _name = widget._modal.partyLedgerName;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    LedgerModal? _ledger;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(icon: Icon(Icons.picture_as_pdf),
              onPressed: ()
              {reportPaymentsInvoice(context, widget._modal,company,_ledger!);}
          )],
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Tax Invoice'),
      ),
      body: ListView(
        padding: EdgeInsets.all(18),
        children: [
          FutureBuilder<LedgerModal?>(
            future: periods.account.getLedgerModal(_name),
            builder: (_, AsyncSnapshot<LedgerModal?> snapshot) {
              _ledger = snapshot.data;
              return _ledger!=null?
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: ConstrainedBox(
                  constraints: BoxConstraints(minWidth:.50*width),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(minHeight: 0.50*height),
                      child: Padding(
                        padding: EdgeInsets.all(14),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                width:   width,
                                child: Stack(
                                  children: <Widget>[
                                    Center(
                                      child: getRowDesign('TAX INVOICE', 15),
                                    ),
                                    Image.asset('assets/logo.png',

                                      height: 80,
                                      width: 60,
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    width: 0.75 * width,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        getRowDesign(company.name, 18),
                                        getRowDesign(company.address, 15),
                                        getRowDesign('GST No :- ' + company.gstin!, 15),
                                        getRowDesign('Email :- ' +company.email!, 15),
                                        getRowDesign('INVOICE NO :- ${widget._modal.narration}', 15),
                                        getRowDesign('Date :- ${widget._modal.voucherDate}', 15),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 0.75 * width,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        getRowDesign(widget._modal.partyLedgerName, 18),
                                        getRowDesign('${_ledger!.address}', 15),
                                        getRowDesign('GST No :- ${_ledger!.partyGstin}', 15),
                                        getRowDesign('Address :- ${_ledger!.address!}', 15),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              DataTable(
                                columns: [
                                  DataColumn(label: Text('ITEM',style: theme().title16b)),
                                  //   DataColumn(label: Text('HSN',style: theme().title16b,)),
                                  DataColumn(label: Text('UNIT',style: theme().title16b,)),
                                  DataColumn(label: Text('RATE',style: theme().title16b,)),
                                  DataColumn(label: Text('QTY',style: theme().title16b,)),
                                  //DataColumn(label: Text('AMT')),
                                  DataColumn(label: Text('TOTAL',style: theme().title16b,)),
                                ], rows: <DataRow>[ ..._product
                                  .map((e) => DataRow(
                                  cells: [
                                    getDataCell12('${e.stockItemName}'),
                                    //  getDataCell12('${e.stockItemName}'),
                                    getDataCell12('PCS'),
                                    getDataCell12('${e.rate}'),
                                    getDataCell12('${e.billedqty}'),
                                    getDataCell12('${e.amount}'),
                                  ]
                              ))
                                  .toList(),
                                DataRow(cells: [
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                ],



                                ),
                                DataRow(cells: [
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                ],



                                ),
                                DataRow(cells: [
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(''),
                                ],



                                ),
                                DataRow(cells: [
                                  getDataCell12(''),
                                  getDataCell12(''),
                                  getDataCell12(' Amount'),
                                  getDataCell12(''),
                                  getDataCell12('${widget._modal.productTotalAmount}'),
                                ],),
                                ...widget._modal.ledgerDetails!.reversed!
                                    .map((q) =>
                                    DataRow(cells: [
                                      getDataCell12(''),
                                      getDataCell12(''),
                                      getDataCell12('${q.ledgerName}'),
                                      getDataCell12(''),
                                      getDataCell12('${q.amount!.split('-').last}'),
                                    ],)),





                                //  dataTable,
                              ],
                              ),
                            ]),),
                    ),
                  ),
                ),

              ):Center(child: CircularProgressIndicator());
              /* Table(
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
                    _value('${widget._modal.voucherNumber}'),
                  ]),
                  TableRow(children: [
                    _key('voucher date'),
                    _value(dateFormat('${widget._modal.voucherDate}')),
                  ]),
                ],
              );*/
            },
          ),

          /*   Table(
            columnWidths: {
              0: FlexColumnWidth(2.0),
              1: FlexColumnWidth(2.0),
              2: FlexColumnWidth(2.0),
              3: FlexColumnWidth(2.0),
              4: FlexColumnWidth(2.0),
              5: FlexColumnWidth(2.0),
            },
            children: [

             *//* ..._list
                  .skipWhile(isEqual)
                  .map((e) => TableRow(children: [
                        _key('${e.ledgerName}'),
                        _value('${e.amount}'),
                      ]))
                  .toList(),
              TableRow(children: [
                _key('Total Amount'),
                _value('${_list.firstWhere(isEqual).amount}'),
              ])*//*
            ],
          ),*/
          SizedBox(height: 36),
          Text('${widget._modal.narration}'),



          //  meo.rakesh2020@gmail.commeo

        ],
      ),
    );
  }
}
