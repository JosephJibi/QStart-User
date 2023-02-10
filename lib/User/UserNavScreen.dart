import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/framework.dart';
import 'package:qstart/User/AddComplaint.dart';
import 'package:qstart/User/UserProfile.dart';
import 'package:qstart/User/UserScreenHome.dart';

class UserNavScreen extends StatefulWidget {
   UserNavScreen({super.key});

  @override
  State<UserNavScreen> createState() => _UserNavScreenState();
}

class _UserNavScreenState extends State<UserNavScreen> {
    int index = 2;
    final _pages=[
      UserScreenHome(),
      AddComplaint(),
      UserProfile(),
    ];
  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
          Icon(Icons.home,size: 30,),
          Icon(Icons.add,size: 30,),
          Icon(Icons.person,size: 30,),
          
    ];
    return Scaffold(
      extendBody: true,
      backgroundColor: Color.fromARGB(255, 234, 228, 228),
      
      body: _pages[index],
      bottomNavigationBar: CurvedNavigationBar(
        
         
      
      backgroundColor :Colors.transparent,
        height: 60,
        index: index,
        items: items,
        onTap: (index) {
            setState(() {
              this.index = index;
            });
        }
      ),
    );
  }
}