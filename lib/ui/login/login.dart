import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';
import 'package:konnect/theme/theme.dart';

class LoginPage extends StatelessWidget {
  final controllerEmailId = TextEditingController();
  final controllerPassword = TextEditingController();

  TextStyle get _style => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    return Scaffold(backgroundColor: Colors.white,
      body: ListView(
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
            Center(child: Text('WelCome To Tally Konnect',style:theme().title22 ,)),
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
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                    hintText: 'Email',
                    hintStyle: theme().title16w,
                       prefixIcon: Icon(
    Icons.email_outlined,
    color: Colors.white,
    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width/1.2,
              height: 45,
              margin: EdgeInsets.only(top: 32),
              padding: EdgeInsets.only(
                  top: 4,left: 16, right: 16, bottom: 4
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(50)
                  ),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 5
                    )
                  ]
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  icon: Icon(Icons.vpn_key,
                    color: Color(0xff6bceff),
                  ),
                  hintText: 'Password',
                ),
              ),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 16, right: 32
                ),
                child: Text('Forgot Password ?',
                  style: TextStyle(
                      color: Colors.grey
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
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0)),
                      hintText: 'Password', contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      hintStyle: theme().title16w,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _obscureText ? Icons.visibility : Icons.visibility_off,
                          color: Colors.white,
                        ),
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                      ),
                      prefixIcon: Icon(
                        Icons.lock_open,
                        color: Colors.white,
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
              onPressed: () {},
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
