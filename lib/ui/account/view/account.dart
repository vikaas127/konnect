import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/component/component.dart';
import 'package:konnect/component/route_name.dart';
import 'package:konnect/theme/mycolors.dart';
import 'package:konnect/theme/theme.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PeriodsModal periods = PeriodsModal.watch(context);
    CompanyModal company = periods.single;
    return Scaffold(
appBar:  AppBar(backgroundColor: MyColors.primary,
    leading: IconButton(icon:Icon(Icons.arrow_back_ios),onPressed: (){
      Navigator.of(context).pop(true);
},),
    title: Text('${periods.id} FY',style: theme().title16w,), actions:
    [

]),
      body: Stack(
        children: <Widget>[
          Container(color: MyColors.iconc, height: MediaQuery.of(context).size.height*.22),
          ListView(
              padding: EdgeInsets.only(top: 20),
              children: [

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(

                    child: Card(color: MyColors.primary,
                      borderOnForeground: true,

                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                      child: Container(
                        decoration: BoxDecoration(

                        gradient: LinearGradient(
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                            colors: [ MyColors.gradient3,MyColors.gradient1,MyColors.gradient2,MyColors.primary,
                              MyColors.gradient1, MyColors.gradient3 ]),
                        color: Colors.grey,
                        border: Border.all(
                            width: 0.0
                        ),
                        borderRadius: BorderRadius.all(
                            Radius.circular(15.0) //                 <--- border radius here
                        ),
                      ),
                        child: Table(
                          columnWidths: {
                            0: FlexColumnWidth(0.5),
                            1: FlexColumnWidth(2.4),
                          },
                          children: [
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    top: 6,
                                    bottom: 6,
                                  ),
                                  child: Icon(Icons.person,color:MyColors.white
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                                  child: Text(
                                    company.name ?? '',
                                    style: theme().title16w

                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 12,
                                    top: 6,
                                    bottom: 6,
                                  ),
                                  child: Icon(Icons.email,color:MyColors.white),
                                ),

                                Padding(
                                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                                  child: Text(
                                    company.email ?? '',
                                    style: theme().title14w,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      top: 6,
                                      bottom: 6,
                                    ),
                                    child: Container(height:20,width:20,child: Image.asset('assets/gst.png',color:
                                    MyColors.white,))
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                                  child: Text(
                                    company.gstin ?? '',
                                    style: theme().title14w,
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      top: 6,
                                      bottom: 6,
                                    ),
                                    child: Icon(Icons.account_balance_outlined,color:MyColors.white)
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                                  child: Text(
                                    company.getAddress,
                                    style: theme().title14w
                                  ),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Padding(
                                    padding: const EdgeInsets.only(
                                      left: 12,
                                      top: 6,
                                      bottom: 6,
                                    ),
                                    child: Icon(Icons.calendar_today,color:MyColors.white)
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                                  child: Container(width: 90,alignment: Alignment.centerLeft,
                                    height: 35,
                                    margin: const EdgeInsets.symmetric(horizontal: 75.0),
    padding: const EdgeInsets.all(1.0),
    decoration: BoxDecoration(borderRadius: BorderRadius.circular(15.0),
    border: Border.all(color: MyColors.iconc)
    ),
                                    child: PopupMenuButton(child: Center(child: Text("${periods.id} FY",style: theme().title10w,)),
                                      onSelected: (index) {
                                        PeriodsModal.of(context).setSnapshot(
                                          snapshot: periods.snapshot,
                                          index: index as int,
                                        );
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return [
                                          for (int index = 0; index < periods.length; index++)
                                            PopupMenuItem(
                                              value: index,
                                              child: Text(periods.getId(index)),
                                            )
                                        ];
                                      },
                                    )
                                    /*DropdownButton<String>( value: '${periods.id} FY',
                                      icon: Icon(Icons.arrow_drop_down_sharp,color: MyColors.primary,),
                                      underline: Container(),
                                      items:periods.snapshot.map((dynamic value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Container(width: 100,
                                              child: Text(value.id)),
                                        );
                                      }).toList(),
                                      onChanged: (_) {},
                                    )*/
                                  )

                                ),
                              ],
                            ),
                            /*TableRow(
                    children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 12, top: 6, bottom: 12),
                          child: Text(
                            'Closing Bal.',
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 6,
                            bottom: 6,
                            right: 12,
                          ),
                          child: Text(
                            '₹ ${company.closingBalance}',
                            style: TextStyle(fontSize: 15),
                          ),
                        ),
                    ],
                ),*/
                          ],
                        ),
                      ),
                    ),
                  ),
                ),



                // Masters
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                    child:
                    Column(
                      children: [
                        Header('MASTERS'),
                        Table(
                          //   border: _border,
                          children: [
                            TableRow(
                              children: [
                                Button(
                                  'ledger',
                                  icon: 'assets/icons/link_user.png',
                                  onPressed: () => Navigator.pushNamed(context, LEDGER),
                                ),
                                Button(
                                  'items',
                                  icon: 'assets/icons/items.png',
                                  onPressed: () => Navigator.pushNamed(context, ITEMS),
                                ),
                                Button(
                                  'groups',
                                  icon: 'assets/icons/group.png',
                                  onPressed: () => Navigator.pushNamed(context, GROUPS),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                    child: Column(
                      children: [
                        Header('REPORTS'),
                        Table(
                          // border: _border,
                          children: [
                            TableRow(
                              children: [
                                Button(
                                  'sales',
                                  icon: 'assets/icons/sales_order.png',
                                  onPressed: () => Navigator.pushNamed(context, SALES),
                                ),
                                Button(
                                  'purchase',
                                  icon: 'assets/icons/purchase_order.png',
                                  onPressed: () => Navigator.pushNamed(context, PURCHASE),
                                ),
                                Button(
                                  'debit notes',
                                  icon: 'assets/icons/debit_note.png',
                                  onPressed: () => Navigator.pushNamed(context, DEBIT),
                                ),
                                Button(
                                  'credit notes',
                                  icon: 'assets/icons/credit_note.png',
                                  onPressed: () => Navigator.pushNamed(context, CREDIT),
                                ),
                              ],
                            ),

                            TableRow(
                              children: [
                                Button(
                                  'receipts',
                                  icon: 'assets/icons/receipts.png',
                                  onPressed: () => Navigator.pushNamed(context, RECEIPT),
                                ),
                                Button(
                                  'payments',
                                  icon: 'assets/icons/payments.png',
                                  onPressed: () => Navigator.pushNamed(context, PAYMENT),
                                ),
                                Button(
                                  'stocks',
                                  icon: 'assets/icons/stocks.png',
                                  onPressed: () => Navigator.pushNamed(context, STOCK),
                                ),
                                Button(
                                  'statement',
                                  icon: 'assets/icons/ledger.png',
                                  onPressed: () => Navigator.pushNamed(context, STATEMENT),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ), // Reports
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Header('ADDONS'),
                        Table(
                          // border: _border,
                          children: [
                            TableRow(
                              children: [
                                Button(
                                  'sales order',
                                  icon: 'assets/icons/sales_order.png',
                                  onPressed: () => showSnackBar(context),
                                ),
                                Button(
                                  'link users',
                                  icon: 'assets/icons/link_user.png',
                                  onPressed: () => showSnackBar(context),
                                ),
                                Button(
                                  'quotations',
                                  icon: 'assets/icons/quotations.png',
                                  onPressed: () => showSnackBar(context),
                                ),
                              ],
                            ),
                            TableRow(
                              children: [
                                Button(
                                  'purchase order',
                                  icon: 'assets/icons/purchase_order.png',
                                  onPressed: () => showSnackBar(context),
                                ),
                                Button(
                                  'proforma invoice',
                                  icon: 'assets/icons/proforma_invoice.png',
                                  onPressed: () => showSnackBar(context),
                                ),
                                Button(
                                  'business card',
                                  icon: 'assets/icons/kmb.png',
                                  onPressed: () => showSnackBar(context),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Addons

                Button(
                  'GSTR 2A MISMATCH',
                  icon: 'assets/icons/kmb.png',
                  onPressed: () => showSnackBar(context),
                ),
              ]),
        ],
      ),

    );
  }

  TableBorder get _border => TableBorder(
        // horizontalInside: BorderSide(width: 0.5),
        // verticalInside: BorderSide(width: 0.5),
        bottom: BorderSide(width: 0.5),
        right: BorderSide(width: 0.5),
        left: BorderSide(width: 0.5),
        top: BorderSide(width: 0.5),
      );
}
