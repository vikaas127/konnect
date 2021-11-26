import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/theme/mycolors.dart';
import 'package:konnect/theme/theme.dart';
import 'package:konnect/ui/index/index.dart';
import 'package:konnect/ui/like.dart';
import 'package:konnect/ui/Notification.dart' as d;
import 'Explore.dart';
class home extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
 return home_state();
  }

}
class home_state extends State<home>{
  static List<Widget> _myPages = <Widget>[IndexPage(), Like(), d.Notification(),Explore()];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(body: _myPages[_selectedIndex],
     bottomNavigationBar: BottomNavigationBar(selectedItemColor: MyColors.primary,
     selectedLabelStyle: theme().title14b,
     type: BottomNavigationBarType.fixed,
     items: const <BottomNavigationBarItem>[
       BottomNavigationBarItem(
         icon: Icon(
           Icons.home,
         ),
         title: Text('Home'),
       ),
       BottomNavigationBarItem(
         icon: Icon(
           Icons.favorite,
         ),
         title: Text(
           'Like',
         ),
       ),
       BottomNavigationBarItem(
         icon: Icon(Icons.notifications),
         title: Text('notification'),
       ),
       BottomNavigationBarItem(
         icon: Icon(Icons.explore),
         title: Text('Explore'),
       ),

     ],
     currentIndex: _selectedIndex,
     onTap: _onItemTapped,
   ),);
  }

}