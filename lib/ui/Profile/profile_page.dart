import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:konnect/theme/theme.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return Profile_state();
  }

}
class Profile_state extends State<Profile>{
  void initState() {
    fun_getUserdata();
   // _future =  FirestoreServices.of(context).getCompany();
  }

  TextEditingController searchController = new TextEditingController();

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
      appBar: AppBar( automaticallyImplyLeading: false,leading: IconButton(onPressed: (){
        Navigator.pop(context);
      },icon: Icon(Icons.arrow_back_ios),),


          title: Text('Profile',style: theme().title16w,), actions: [

          ]),
      body:ListView(children: [
        SizedBox(height: 50,),
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
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(child: Text('${username}',style:theme().title14b,)),
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Center(child: Text('${email}',style:theme().title14b,)),
        ),

      ],) ,);
  }

}