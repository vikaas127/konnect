import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/theme/theme.dart';

class Notification extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Notification_state();
  }

}
class Notification_state extends State<Notification>{
  TextEditingController searchController = new TextEditingController();


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
    return Scaffold(
      appBar: AppBar( automaticallyImplyLeading: false, bottom: PreferredSize(child:Column(
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
                hintText: 'Notifications.....',
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
        title: Text('Notification',style: theme().title16w,), actions: [

        ]),
      body:Container() ,);
  }

}