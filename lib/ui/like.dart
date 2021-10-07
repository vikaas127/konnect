import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/component/component.dart';
import 'package:konnect/component/custom_widget.dart';
import 'package:konnect/component/route_name.dart';
import 'package:konnect/modal/company/company_modal.dart';
import 'package:konnect/modal/company/periods_modal.dart';
import 'package:konnect/services/firestore_services.dart';
import 'package:konnect/theme/theme.dart';

class Like extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
  return Like_state();
  }

}
class Like_state extends State<Like>{
  TableRow _spaceRow(double height) {
    return TableRow(children: <Widget>[
      SizedBox(height: height),
      SizedBox(height: height),
    ]);
  }
  TextEditingController searchController = new TextEditingController();

  Widget buildMovieShimmer() =>
      Card(shadowColor: Colors.grey,
        child: ListTile(
          leading: CustomWidget.rectangular(height: 64, width: 64),
          title: Align(
            alignment: Alignment.centerLeft,
            child: CustomWidget.rectangular(height: 16,
              width: MediaQuery.of(context).size.width*0.3,),
          ),
          subtitle: CustomWidget.rectangular(height: 14),
        ),
      );
  OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.white,
          width: 1,
        )
    );
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(appBar: AppBar(automaticallyImplyLeading: false,
      bottom: PreferredSize(child:Column(
    children: [
      new Padding(

        padding: new EdgeInsets.symmetric(vertical: 4.0,horizontal: 18),
        child: Container(
          height: 45,
          child: new TextField(onTap: (){
            /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) =>
                      // VerificationPhoneRoute()
                      Searchscreen()
                    //  FormSignUpRoute()
                  ),
                );*/
          },
            controller: searchController,
            decoration: InputDecoration(
              focusedBorder: myfocusborder(),filled: true,
              fillColor: Colors.white,hintStyle:TextStyle(color: Colors.grey) ,
              prefixIcon:
              IconButton(onPressed: null,icon:Icon(Icons.search),color: Colors.black,),
              hintText: 'Search your Likes ledger,statement.....',
              contentPadding: EdgeInsets.fromLTRB(25.0, 15.0, 25.0, 15.0),
              border: OutlineInputBorder(

                  borderSide: BorderSide(
                    color:Colors.white,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(20.0)),
            ),
          ),
        ),
      ),
      SizedBox(height: 10,)
    ],
  ) ,
    preferredSize: MediaQuery.of(context).size*0.07,),
      title: Text('Like',style: theme().title16w,), actions: [

      ]),
    body: FutureBuilder(
      future: FirestoreServices.of(context).getCompany(),
      builder: (_, AsyncSnapshot<List<PeriodsModal>> snapshot) {
        var view = snapshotView(snapshot);
        if (view != null) return ListView.builder(itemCount: 9,
            itemBuilder: (context,index){
              return buildMovieShimmer();});

        var _list = snapshot.
        data!;

        return ListView.separated(
          itemCount: _list.length,
          padding: EdgeInsets.all(9),
          itemBuilder: (_, int index) {
            PeriodsModal periods = _list[index];
            CompanyModal company = periods.single;


            return Card(shadowColor: Colors.grey,
              child: ListTile(
                onTap: () {
                  PeriodsModal.of(context).setSnapshot(
                    snapshot: periods.snapshot,
                    index: periods.length - 1,
                  );
                  Navigator.pushNamed(context, ACCOUNT);
                },
                leading: Image.asset('assets/logo.png'),
                title:
                Text(
                  (company.name ?? 'Name').toUpperCase(),
                  style:theme().title14b,
                ),

                subtitle: Table(
                  columnWidths: {
                    0: FlexColumnWidth(0.5),
                    1: FlexColumnWidth(2.5),
                  },
                  children: <TableRow>[
                    _spaceRow(5),
                    TableRow(children: <Widget>[
                      Container(height: 20,width: 20,
                          child: Image.asset('assets/gst.png')),

                      Text(
                          '${company.gstin ?? ''}',
                          style:theme().title14
                      ),
                    ]),
                    _spaceRow(9),
                    TableRow(children: <Widget>[
                      Container(height: 20,width: 20,
                          child: Image.asset('assets/calnder.jpg')),
                      Text(
                          '${company.booksFrom ?? ''}',
                          style:theme().title14
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
    ),);
  }

}