import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/component/component.dart';
import 'package:konnect/component/route_name.dart';
import 'package:konnect/services/firestore_services.dart';

class IndexPage extends StatelessWidget {
  _logout(BuildContext context) {
    var _radius = Radius.circular(9);
    var _all = BorderRadius.all(_radius);
    var _only = BorderRadius.only(
      topRight: _radius,
      topLeft: _radius,
    );
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: _all),
        title: Container(
          padding: EdgeInsets.only(left: 12),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: _only,
          ),
          child: Row(children: [
            Expanded(
              child: Text(
                'Logout'.toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            IconButton(
              onPressed: () => Navigator.pop(context, true),
              icon: Icon(
                Icons.cancel,
                color: Colors.white,
              ),
            ),
          ]),
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              width: double.maxFinite,
              alignment: Alignment.center,
              child: Text(
                'Are you sure want to logout??',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, true);
                AuthModel.of(context).signOut();
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        titlePadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.only(bottom: 18),
      ),
    );
  }

  TableRow _spaceRow(double height) {
    return TableRow(children: <Widget>[
      SizedBox(height: height),
      SizedBox(height: height),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome Tally'), actions: [
        IconButton(
          onPressed: () => _logout(context),
          icon: Icon(Icons.logout),
        ),
      ]),
      body: FutureBuilder(
        future: FirestoreServices.of(context).getCompany(),
        builder: (_, AsyncSnapshot<List<PeriodsModal>> snapshot) {
          var view = snapshotView(snapshot);
          if (view != null) return view;

          var _list = snapshot.data!;

          return ListView.separated(
            itemCount: _list.length,
            padding: EdgeInsets.all(9),
            itemBuilder: (_, int index) {
              PeriodsModal periods = _list[index];
              CompanyModal company = periods.single;
              return Card(
                child: ListTile(
                  onTap: () {
                    PeriodsModal.of(context).setSnapshot(
                      snapshot: periods.snapshot,
                      index: periods.length - 1,
                    );
                    Navigator.pushNamed(context, ACCOUNT);
                  },
                  title: Text(
                    (company.name ?? 'Name').toUpperCase(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Table(
                    columnWidths: {
                      0: FlexColumnWidth(1.3),
                      1: FlexColumnWidth(2.0),
                    },
                    children: <TableRow>[
                      _spaceRow(12),
                      TableRow(children: <Widget>[
                        Text(
                          'GSTIN',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          ':${company.gstin ?? ''}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                      _spaceRow(9),
                      TableRow(children: <Widget>[
                        Text(
                          'BOOKS FROM',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          ':${company.booksFrom ?? ''}',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ]),
                      _spaceRow(6),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (_, index) => SizedBox(height: 9),
          );
        },
      ),
    );
  }
}
