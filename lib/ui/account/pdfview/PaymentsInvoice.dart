
import 'package:konnect/modal/account/reports/invoice/invoice_modal.dart';
import 'package:konnect/modal/company/company_modal.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/ui/account/pdfview/pdf_viewer_page.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;


reportPaymentsInvoice(context, InvoiceModal model, CompanyModal
company,LedgerModal ledgerdata) async {

  /* String _upi;
  //print('aaaaaaa${bankValue.accNo } ${bankValue.ifscCode}');

    String note =  'konnect';
    String name = basicInfo.organisation.replaceAll(' ', '+');
    String bank = '${bankValue.accNo}@${bankValue.ifscCode}.ifsc.npci';
    String upi = bankValue.upi.isEmpty ? bank : bankValue.upi;

    _upi = 'upi://pay?pa=$upi&pn=$name&tn=$note';
    print(_upi);*/


  final Document pdf = Document();




  int length= model.products!.length;
  for (int i = 0; i < model.products!.length ; i++) {
    pdf.addPage(MultiPage(
        pageFormat:
        PdfPageFormat.a4,
        crossAxisAlignment: CrossAxisAlignment.start,
        header: (Context context) {
          if (context.pageNumber == 1) {
            return Container();
          }
          return Container(

            alignment: Alignment.centerRight,
            margin: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),
            padding: const EdgeInsets.only(bottom: 3.0 * PdfPageFormat.mm),

          );
        },
        footer: (
            Context context) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child:    Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[

                      Container(
                          height: 60),
                      getRowDesign(

                        company?.name,
                        15,

                      ),
                      Container(height: 30),

                      getRowDesign(
                        'Auth Signatory',
                        8,

                      ),

                    ],
                  ),

                ),
                SizedBox(height: 20),
                Row(children:[
                  getRowDesign(
                    "This document is powered by TallyKonnect.com",
                    8,),Container(width: 60),
                  Container(
                      alignment: Alignment.centerRight,
                      margin: const EdgeInsets.only(top: 1.0 * PdfPageFormat.cm),
                      child: Text('Page ${context.pageNumber} of ${context.pagesCount}',
                          style: Theme.of(context)
                              .defaultTextStyle
                              .copyWith(color: PdfColors.grey)))])
              ]);

        },
        build:
            (Context context) => <Widget>[
          Header(level:0,child:
          Column(children: [
            Center(
                child:   Text('Recipt',
                  style: Theme.of(context)
                      .defaultTextStyle
                      .copyWith(color: PdfColors.black,
                      fontSize:15 ,fontWeight: FontWeight.bold)
                  ,)
            ),
            Container(height: 30),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[

                Container(
                  width: 220,
                  child:Center(child:
                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: <Widget>[
                      getRowDesign('FROM', 12),

                      getRowDesign(company.name, 10),
                      getRowDesign(company. address, 10),
                      getRowDesign('GST No :- ' + '${company.gstin}', 10),
                      getRowDesign(
                          'Phone :- ' + '${company.email}',
                          10),
                      getRowDesign(
                          'INVOICE NO :- ${model.voucherNumber}',
                          10),
                      getRowDesign(
                          'Date :- ${model.voucherDate}',
                          10),

                    ],
                  )),
                ),
                Container(
                    width: 40
                ),
                Container(
                  width: 220,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      getRowDesign('To', 12),
                      getRowDesign(ledgerdata.name, 10),
                      getRowDesign(
                          '${ledgerdata.address }',
                          8),

                      getRowDesign(
                          'GST No :- ${ledgerdata.partyGstin}', 10),
                      getRowDesign('Phone :- ', 10),
                    ],
                  ),
                ),


              ],
            ),])

          ),



          Table.fromTextArray(context: context,cellAlignment: Alignment.center,cellStyle:TextStyle(color: PdfColors.black ,
              fontSize: 8) ,
              rowDecoration:BoxDecoration(borderRadius:BorderRadius.zero),
              border: TableBorder(verticalInside: BorderSide.none,horizontalInside: BorderSide.none,bottom:
              BorderSide.none,left: BorderSide.none,
                  top: BorderSide.none,right: BorderSide.none),
              headerDecoration: new BoxDecoration(color:  PdfColors.blue,),tableWidth:
              TableWidth.max,defaultColumnWidth: FixedColumnWidth(250.0),
              headerStyle: TextStyle(color: PdfColors.white,fontWeight: FontWeight.bold ,fontSize: 10),
              data: <List<String>>[
                <String>['ITEM', 'UNIT','RATE','QTY','TOTAL'],
                for (int i = 0; i <length; i++)

                  <String>[
                    '${model.products![i].stockItemName}',
                    'PICS',
                    '${model.products![i].rate}',
                    '${model.products![i].actualQty}',
                    '${model.products![i].amount!.split('-').last}'
                  ],


                for (int i =0 ; i <10; i++)

                  <String>[
                    '',
                    '',

                    '',
                    '',
                    ''
                  ],
                <String>[
                  '',
                  '',

                  'Amount',
                  '',
                  '${model.productTotalAmount!.split('-').last}'
                ],
                ...model.ledgerDetails!.reversed.map((e) => <String>[

                  '',
                  '',
                  '${e.ledgerName}',
                  '',
                  '${(e.amount!.split('-').last)}'
                ], )
              ]

          ),








        ]));
  }
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/receipt.pdf';
  final File file = File(path);
  await file.writeAsBytes( await  pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );
}
getRowDesign(String ? text, double fontSize) {
  return Padding(
    padding: EdgeInsets.only(top: 3, bottom: 3),
    child: Text(
      text!,
      style: TextStyle(font:Font.helveticaBold(),
          fontSize: fontSize,

          fontWeight: FontWeight.bold),
    ),
  );
}
getBankDesign(String text, double fontSize) {
  return Padding(
    padding: EdgeInsets.only(top: 3, bottom: 3),
    child: Text(
      text,
      style: TextStyle(font: Font.helveticaBold(),
          fontSize: fontSize,
          color: PdfColors.grey,
          fontWeight: FontWeight.bold),
    ),
  );
}
getdesign(String text) {
  return Padding(
    padding: EdgeInsets.only(top: 3, bottom: 3),
    child: Text(
      text,
      style:
      TextStyle(font: Font.helveticaBold(),
          fontSize: 20,
          color: PdfColors.blue,
          fontWeight: FontWeight.bold),
    ),
  );
}
