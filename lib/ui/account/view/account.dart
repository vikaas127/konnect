import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/component/component.dart';
import 'package:konnect/component/route_name.dart';

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    PeriodsModal periods = PeriodsModal.watch(context);
    CompanyModal company = periods.single;
    return Scaffold(
      appBar: AppBar(title: Text('${periods.id} FY'), actions: [
        PopupMenuButton(
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
      ]),
      body: ListView(padding: EdgeInsets.only(top: 12), children: [
        Table(
          columnWidths: {
            0: FlexColumnWidth(1.0),
            1: FlexColumnWidth(2.0),
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
                  child: Text(
                    'Name',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                  child: Text(
                    company.name ?? '',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
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
                  child: Text(
                    'Email Id',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                  child: Text(
                    company.email ?? '',
                    style: TextStyle(fontSize: 15),
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
                  child: Text(
                    'GSTIN',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                  child: Text(
                    company.gstin ?? '',
                    style: TextStyle(fontSize: 15),
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
                  child: Text(
                    'Address',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6, bottom: 6, right: 12),
                  child: Text(
                    company.getAddress,
                    style: TextStyle(fontSize: 15),
                  ),
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
        Header('MASTERS'), // Masters
        Table(
          border: _border,
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
        Header('REPORTS'), // Reports
        Table(
          border: _border,
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
        Header('ADDONS'), // Addons
        Table(
          border: _border,
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
        Button(
          'GSTR 2A MISMATCH',
          icon: 'assets/icons/kmb.png',
          onPressed: () => showSnackBar(context),
        ),
      ]),
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
