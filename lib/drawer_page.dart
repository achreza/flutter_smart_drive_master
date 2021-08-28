import 'package:flutter/material.dart';
import 'package:flutter_navigation/Screens/forummenu.dart';
import 'package:flutter_navigation/Screens/menuprofil.dart';
import 'package:flutter_navigation/Screens/pembayaran.dart';
import 'package:flutter_navigation/Screens/setting.dart';
import 'package:flutter_navigation/constants.dart';
import 'package:flutter_navigation/responsive_layout.dart';
import 'package:hexcolor/hexcolor.dart';

import 'Screens/contactus.dart';
import 'Screens/forumchat.dart';
import 'Screens/home.dart';
import 'Screens/profile.dart';
import 'Screens/admin.dart';
import 'course_view.dart';
import 'main.dart';

class ButtonsInfo {
  String title;
  IconData icon;

  ButtonsInfo({required this.title, required this.icon});
}

class Task {
  String task;
  double taskValue;
  Color color;

  Task({required this.task, required this.taskValue, required this.color});
}

int _currentIndex = 0;

List<ButtonsInfo> _buttonNames = [
  ButtonsInfo(title: "Course", icon: Icons.directions_car_filled_outlined),
  ButtonsInfo(title: "Profile", icon: Icons.person),
  ButtonsInfo(title: "Forum", icon: Icons.forum_outlined),
  ButtonsInfo(title: "Contact", icon: Icons.contact_phone_outlined),
  ButtonsInfo(title: "Logout", icon: Icons.logout_outlined),
];

void _pindah(int index) {}

showAlertDialog(BuildContext context) {
  // set up the buttons
  Widget cancelButton = TextButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context, rootNavigator: true).pop(true);
    },
  );
  Widget continueButton = TextButton(
    child: Text("Logout"),
    onPressed: () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => LoginUser()));
      Navigator.of(context, rootNavigator: true).pop(true);
    },
  );

  // set up the AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Logout"),
    content: Text("Are you sure to Logout from SmartDrive?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );

  // show the dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}

class DrawerPage extends StatefulWidget {
  late String namauser;
  DrawerPage({required this.namauser});
  @override
  _DrawerPageState createState() => _DrawerPageState(namauser: namauser);
}

class _DrawerPageState extends State<DrawerPage> {
  late String namauser;
  _DrawerPageState({required this.namauser});
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        color: HexColor("#3B4254"),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(Constants.kPadding * 4),
            child: Column(
              children: [
                ListTile(
                  title: Text(
                    "Dashboard Menu",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  trailing: !ResponsiveLayout.isComputer(context)
                      ? IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.close, color: Colors.white),
                        )
                      : null,
                ),
                ...List.generate(
                  _buttonNames.length,
                  (index) => Column(
                    children: [
                      Container(
                        decoration: index == _currentIndex
                            ? BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                gradient: LinearGradient(
                                  colors: [
                                    Constants.red.withOpacity(0.9),
                                    Constants.orange.withOpacity(0.9),
                                  ],
                                ),
                              )
                            : null,
                        child: ListTile(
                          title: Text(
                            _buttonNames[index].title,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          leading: Padding(
                            padding: const EdgeInsets.all(Constants.kPadding),
                            child: Icon(
                              _buttonNames[index].icon,
                              color: Colors.white,
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              _currentIndex = index;
                              if (index == 0) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CourseView(
                                              namauser: namauser,
                                            )));
                              }
                              if (index == 1) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuProfile(
                                              namauser: namauser,
                                            )));
                              }
                              if (index == 2) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MenuForum(
                                              namauser: namauser,
                                            )));
                              }
                              if (index == 3) {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Kontak(namauser: namauser)));
                              }
                              if (index == 4) {
                                showAlertDialog(context);
                              }
                            });
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      Divider(
                        color: Colors.white,
                        thickness: 0.1,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
