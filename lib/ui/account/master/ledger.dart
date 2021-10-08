import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/component/route_name.dart';
import 'package:konnect/modal/modal.dart';

import 'package:konnect/component/component.dart';
import 'package:konnect/theme/theme.dart';
import 'package:konnect/ui/Profile/profile_page.dart';

class LedgerPage extends StatelessWidget {
  TextEditingController searchController = new TextEditingController();

  onChanged(String value) {
   /* _list= <PeriodsModal>[];
    search.forEach((item) {
      String q1= item.getSnapshot['NAME'];

      setState(() {
        if (q1.toLowerCase().contains(value.toLowerCase())){

          print('search item name ${item.getSnapshot['NAME']} == ${value} ');
          _list.add(item);
        }
      });

    });*/
  }


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
    PeriodsModal services = PeriodsModal.of(context);
    return Scaffold(
      appBar: AppBar(
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
                onChanged: onChanged,
                controller: searchController,
                decoration: InputDecoration(
                  focusedBorder: myfocusborder(),filled: true,
                  fillColor: Colors.white,hintStyle:TextStyle(color: Colors.grey) ,
                  prefixIcon:
                  IconButton(onPressed: null,icon:Icon(Icons.search),color: Colors.black,),
                  hintText: 'ledger....',
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
          title: Text('Ledger',style: theme().title16w,),

      ),
      body: FutureBuilder(
        future: services.account.getLedger(),
        builder: (_, AsyncSnapshot<List<LedgerModal>> snapshot) {
          var view = snapshotView(snapshot);
          if (view != null) return view;

          var _list = snapshot.data!;

          var controller = TextEditingController();
          return StatefulBuilder(builder: (_, setState) {
            controller.addListener(() => setState(() {
                  String value = controller.text;
                  if (value.isEmpty)
                    _list = snapshot.data!;
                  else
                    _list = [];
                  snapshot.data!.forEach((modal) {
                    var name = modal.name!.toLowerCase();
                    if (name.contains(value.toLowerCase())) {
                      _list.add(modal);
                    }
                  });
                }));
            return SearchListView(
              controller: controller,
              children: _list
                  .map((modal) => Card(

                        child: ListTile(
                          onTap: () =>  Navigator.pushNamed(
                            context,
                            LEDGER_VIEW,
                            arguments: modal,
                          ),
                          title: Text(modal.name ?? 'Name',style: theme().title16b,),
                        ),
                      ))
                  .toList(),
            );
          });
        },
      ),
    );
  }

}
