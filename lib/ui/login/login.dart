import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/theme/MyText.dart';
import 'package:konnect/theme/mycolors.dart';
import 'package:konnect/theme/theme.dart';

import 'Forgot_password.dart';

class LoginPage extends StatelessWidget {
  final controllerEmailId = TextEditingController(text: 'rakeshsuvidya@gmail.com');
  final controllerPassword = TextEditingController(text: 'singh123');

  TextStyle get _style => TextStyle(
        color: Colors.blueAccent,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    return Scaffold(backgroundColor: Colors.white,
      body:
      /* Stack(
        children: <Widget>[
          Container(color: MyColors.primary, height: 220),
          Column(
            children: <Widget>[
              Container(height: 40),
              Container(
                child: Image.asset('assets/logo.png'),
                  color: Colors.white,

                width: 80, height: 80,
              ),
              Card(
                  shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(6)),
                  margin: EdgeInsets.all(25),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child :  Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(height: 25),
                        Text("SIGN IN", style: MyText.title(context)!.copyWith(
                            color: Colors.black26, fontWeight: FontWeight.bold
                        )),
                        TextField(

                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(labelText: "Email",
                            labelStyle: theme.title12,
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color:Colors.blueGrey, width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                            ),
                          ),
                        ),
                        Container(height: 25),
                        TextField(
                          keyboardType: TextInputType.text,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(labelText: "Password",
                            labelStyle: TextStyle(color: Colors.blueGrey[400]),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 1),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey, width: 2),
                            ),
                          ),
                        ),
                        Container(height: 25),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: FlatButton(
                            child: Text("SUBMIT",
                              style: TextStyle(color: Colors.white),),
                            color: MyColors.primary,
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(20)
                            ),
                            onPressed: () {

                              //BottomNavigationMainRoute
                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: FlatButton(
                            child: Text("Forgot Password?",
                              style: TextStyle(color: MyColors.primaryLight),),
                            color: Colors.transparent,
                            onPressed: () {

                            },
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: FlatButton(
                            child: Text("New user? Sign Up",
                              style: TextStyle(color: MyColors.primaryLight),),
                            color: Colors.transparent,
                            onPressed: () {
                            *//*
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                    // VerificationPhoneRoute()
                                    // LoginCardOverlapRoute()
                                    FormSignUpRoute()
                                ),
                              );*/
      /*
                            },
                          ),
                        ),
                      ],
                    ),
                  )
              )
            ],
          )
        ],
      ),*/
      ListView(
          padding: EdgeInsets.only(left: 24, right: 24),
          shrinkWrap: true,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height*.18,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 48,vertical: 10),
              child: Image.asset(
                'assets/logo.png',
                height: 120,
              ),
            ),
           // SizedBox(height: MediaQuery.of(context).size.height*.02,),
            Container(
                padding: EdgeInsets.all(18),
                child:
                Center(child: Text('Login',style:theme().title18 ,))),
            SizedBox(height: MediaQuery.of(context).size.height*.05,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 4),
              child: Container(height: 55,
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autofocus: false,
                  style: _style,
                  controller: controllerEmailId,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    border: OutlineInputBorder(borderRadius:
                    BorderRadius.circular(30.0)),
                    hintText: 'Email',
                    fillColor: Colors.grey,

                    hintStyle: theme().title16g,
                       prefixIcon: Icon(
    Icons.email_outlined,
    color: Colors.grey,
    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height*.01,),
            StatefulBuilder(
              builder: (_, setState) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:4 ),
                child: Container(height: 55,
                  child: TextFormField(
                    style: _style,
                    controller: controllerPassword,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(borderRadius:
                      BorderRadius.circular(30.0)),
                      hintText: 'Password', contentPadding:
                    EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintStyle: theme().title16g,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Colors.grey,
                        ),
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Colors.grey,
                      ),
                    //  hintText: 'Password',
                    ),
                    obscureText: _obscureText,
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (BuildContext context) =>
                // VerificationPhoneRoute()
                ForgotPage()
                ));
              },
              child: Container(
                  padding: EdgeInsets.all(18),
                  child:
                  Text('Forgotten Password?',style:theme().title16b ,)),
            ),
            SizedBox(height: 5),
            Container(
              height: 50.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: RaisedButton(
                  onPressed: () {
                    var emailId = controllerEmailId.text;
                    var password = controllerPassword.text;
                    if (emailId.length == 0 || password.length == 0) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Container(
                          height: 60,
                          alignment: Alignment.center,
                          child: Text('All Fields are Required'),
                        ),
                      ));
                      return;
                    }
                    var modal = AuthModel.of(context);
                    modal.logIn(email: emailId, password: password);
                  },
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [Color(0xff374ABE), Color(0xff64B6FF)],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                        borderRadius: BorderRadius.circular(30.0)
                    ),
                    child: Container(
                   //   constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        "SUBMIT",
                        textAlign: TextAlign.center,
                        style: theme().title16w,
                      ),
                    ),
                  ),
                ),
              ),
            ),


          ]),
    );
  }
}
