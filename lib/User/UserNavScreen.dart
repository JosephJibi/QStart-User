import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:qstart/utilities/dimensions.dart';
import 'AddComplaint.dart';
import 'UserProfile.dart';
import 'UserScreenHome.dart';

class UserNavScreen extends StatefulWidget {
  const UserNavScreen({super.key});

  @override
  State<UserNavScreen> createState() => _UserNavScreenState();
}

class _UserNavScreenState extends State<UserNavScreen> {
  int index = 0;
  final _pages = [
    UserScreenHome(),
    AddComplaint(),
    UserProfile(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[index],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: Dimensions.height28, vertical: Dimensions.width10),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(Dimensions.height30),
            child: GNav(
                onTabChange: (value) {
                  setState(() {
                    index = value;
                  });
                },
                gap: Dimensions.height8,
                // backgroundColor: Colors.lightBlue.withOpacity(0.3),
                backgroundColor: Colors.blue,
                color: Colors.black,
                activeColor: Colors.white,
                // tabBackgroundGradient: LinearGradient(
                //                colors: [Colors.white70,Colors.white54, Colors.white38],
                //                begin: Alignment.bottomLeft,
                //                end: Alignment.topRight),

                padding: EdgeInsets.all(Dimensions.height15),
                tabBorderRadius: Dimensions.height25,
                tabs: [
                  GButton(
                    textStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.height15),
                    iconColor: Colors.white54,
                    iconSize: Dimensions.height20,
                    // icon: Icons.home,
                    icon: FontAwesomeIcons.house,
                    text: 'Home',
                  ),
                  GButton(
                    textStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.height15),
                    iconColor: Colors.white54,
                    iconSize: Dimensions.height25,
                    icon: Icons.category,
                    text: 'Category',
                  ),
                  GButton(
                    textStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: Dimensions.height15),
                    iconColor: Colors.white54,
                    iconSize: Dimensions.height25,
                    icon: Icons.person,
                    text: 'Profile',
                  ),
                ]),
          ),
        ),
      ),
    );
  }
}
