import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konnect/component/custom_widget.dart';

import 'package:konnect/modal/modal.dart';
import 'package:konnect/component/component.dart';
import 'package:konnect/component/route_name.dart';
import 'package:konnect/services/firestore_services.dart';
import 'package:konnect/theme/mycolors.dart';
import 'package:konnect/theme/theme.dart';
import 'package:konnect/ui/Profile/profile_page.dart';
import 'package:share/share.dart';

class IndexPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
  return IndexPage_state();
  }
}
class IndexPage_state extends State<IndexPage>{
  late Future<List<PeriodsModal>> _future;
  void initState() {
    fun_getUserdata();
    _future =  FirestoreServices.of(context).getCompany();
    _future.asStream().map((event) => search.addAll(event));
  }
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
            color: MyColors.primary,
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
  loadJsonData(){

  }
  TableRow _spaceRow(double height) {
    return TableRow(children: <Widget>[
      SizedBox(height: height),
      SizedBox(height: height),
    ]);
  }
  double xOffset = 0;
  dynamic _pickImageError;
  double yOffset = 0;
  double scaleFactor = 1;
  bool isLoading = false;

  final ImagePicker _picker = ImagePicker();
  bool isDrawerOpen = false;
  late FirebaseFirestore firestoreInstance =FirebaseFirestore.instance;
late File _imageFile ;
  String imageUrl = "";
  List<PeriodsModal> search= [];
  List<PeriodsModal> _list=[];
  late String username='username', email='email id',profileavtor='';
fun_getUserdata(){
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  firestoreInstance.collection(firebaseUser!.uid).doc('Tally Konnect').
  collection('Users Info').doc(firebaseUser.email).get(

      ).then((querySnapshot) {
    querySnapshot.data();
    setState(() {
      username= querySnapshot['firstName'].toString()+querySnapshot['lastName'].toString();
      email =querySnapshot['email'].toString();
      profileavtor=querySnapshot['image'].toString();
    });
    print(querySnapshot.data());
      }).then((_){
    print("success!");
  });
}
fun_setdata(String imag){
  var firebaseUser =  FirebaseAuth.instance.currentUser;
  firestoreInstance.collection(firebaseUser!.uid).doc('Tally Konnect').collection('Users Info').doc(firebaseUser.email).
  update(
      {
        "image" : imag,


      }).then((_){
    print("success!");
  });
}
  Future uploadFile() async {
    String fileName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child(fileName);
    UploadTask uploadTask = reference.putFile(_imageFile);

    try {
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
      setState(() {
        isLoading = false;
        fun_setdata(imageUrl);
      });
    } on FirebaseException catch (e) {
      setState(() {
        isLoading = false;
      });
      Fluttertoast.showToast(msg: e.message ?? e.toString());
    }
  }
  TextEditingController searchController = new TextEditingController();

  onChanged(String value) {
    _list= <PeriodsModal>[];
    search.forEach((item) {
      String q1= item.getSnapshot['NAME'];

      setState(() {
        if (q1.toLowerCase().contains(value.toLowerCase())){

          print('search item name ${item.getSnapshot['NAME']} == ${value} ');
          _list.add(item);
        }
      });

    });}


    OutlineInputBorder myfocusborder(){
    return OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(
          color:Colors.white,
          width: 1,
        )
    );
  }
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
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        drawer:Drawer(child:
      ListView(children: [

        Container(height:MediaQuery.of(context).size.height*0.27 ,
          color:MyColors.primary,
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
              InkWell(onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: new Icon(Icons.camera),
                            title: new Text('Camera'),
                            onTap: () async {

                              try {
                                final pickedFile = await _picker.pickImage(
                                  source:ImageSource.camera,
                               //   maxWidth: maxWidth,
                                //  maxHeight: max,
                                  imageQuality: 70,
                                );
                                setState(() {
                                  _imageFile =File( pickedFile!.path);
                                  if (_imageFile != null) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    uploadFile();
                                  }
                                });
                              } catch (e) {
                                setState(() {
                                  _pickImageError = e;
                                });
                              }
                              Navigator.pop(context);
                            },
                          ),
                          ListTile(
                            leading: new Icon(Icons.photo),
                            title: new Text('Gallery'),
                            onTap: () async {
                              try {
                                final pickedFile = await _picker.pickImage(
                                  source:ImageSource.gallery,
                                  //   maxWidth: maxWidth,
                                  //  maxHeight: max,
                                  imageQuality: 70,
                                );
                                setState(() {
                                  _imageFile =File( pickedFile!.path);
                                  if (_imageFile != null) {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    uploadFile();
                                  }
                                });
                              } catch (e) {
                                setState(() {
                                  _pickImageError = e;
                                });
                              }
                              Navigator.pop(context);
                            },
                          ),

                        ],
                      );
                    });



              },
                  child: CircleAvatar(
                    radius: 50,foregroundColor:Colors.blue,foregroundImage: NetworkImage(profileavtor),
                    backgroundColor:Colors.white,backgroundImage:AssetImage('assets/prsn.png'))),
              SizedBox(width: 20,),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('${username}',style:theme().title14w,),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Text('${email}',style:theme().title14w,),
              ),
              SizedBox(height: 20,),
            ],
          ),
        ),
        Divider(),
        SizedBox(height: 20,),
        Container(height: MediaQuery.of(context).size.height*0.30,
          child: Column(
            children:[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: InkWell(onTap: (){

                },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex:2,
                            child: Row(
                              children: [
                                Icon( Icons.account_balance_outlined,color: MyColors.primary,size: 30,),
                                SizedBox(width: 10,),

                                Text('About',style:
                                theme().title18p
                                )
                                ,

                              ],


                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Icon(Icons.arrow_right,color: MyColors.primary,size: 30,),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: InkWell(
                  onTap: (){
                    Share.share('https://www.tallykonnect.com/');
                  },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex:2,
                            child: Row(
                              children: [
                                Icon( Icons.share,color: MyColors.primary,size: 30,),
                                SizedBox(width: 10,),

                                Text('Share',style:theme().title18p ),

                              ],


                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Icon(Icons.arrow_right,color:MyColors.primary,size: 30,),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: InkWell(onTap: (){

                },
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex:2,
                            child: Row(
                              children: [
                                Icon( Icons.settings,color: MyColors.primary,size: 30,),
                                SizedBox(width: 10,),

                                Text('Settings',style:
                                theme().title18p
                                )
                                ,

                              ],


                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Icon(Icons.arrow_right,color: MyColors.primary,size: 30,),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: InkWell(onTap:()=>_logout(context),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(flex:2,
                            child: Row(
                              children: [
                                Icon( Icons.logout,color: MyColors.primary,size: 30,),
                                SizedBox(width: 10,),

                                Text('Logout',style:theme().title18p)
                                ,

                              ],


                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Icon(Icons.arrow_right,color: MyColors.primary,size: 30,),
                              ],
                            ),
                          ),

                        ],
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),


            ],
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height*0.25,),
        Expanded(flex: 2,
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.info_outlined,color: MyColors.primary,),
                  SizedBox(width: 10,),
                  Text('version',style:TextStyle(color: MyColors.primary,fontWeight: FontWeight.bold),),
                  SizedBox(width: 10,),
                  Container(width: 2,height: 20,color: MyColors.primary,),
                  SizedBox(width: 10,),

                  Text('1.0.0',style:TextStyle(color:MyColors.primary,fontWeight: FontWeight.bold),)


                ],

              ),
            ],
          ),
        ),

      ],),),

      appBar: AppBar( bottom: PreferredSize(child:Column(
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
                  hintText: ' gst no.ledger,statement.....',
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
          title: Text('Welcome ${username}',style: theme().title16w,),
          actions: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: InkWell(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                        // VerificationPhoneRoute()
                        Profile()
                    ));


              },
                  child: CircleAvatar(
                      radius: 50,foregroundColor:Colors.blue,foregroundImage: NetworkImage(profileavtor),
                      backgroundColor:Colors.white,backgroundImage:AssetImage('assets/prsn.png'))),
            ),
      ]
      ),
      body: FutureBuilder(
        future:_future,
        builder: (_, AsyncSnapshot<List<PeriodsModal>> snapshot) {
          var view = snapshotView(snapshot);
          if (view != null) return ListView.builder(itemCount: 9,
              itemBuilder: (context,index){
            return buildMovieShimmer();
          });

            _list = snapshot.data!;
         // search.addAll(_list);
         // print('vikaas');
     // print(search.length);
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
      ),
    );
  }
}
