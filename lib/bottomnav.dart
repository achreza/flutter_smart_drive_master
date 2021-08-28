// /// Flutter code sample for BottomNavigationBar

// // This example shows a [BottomNavigationBar] as it is used within a [Scaffold]
// // widget. The [BottomNavigationBar] has four [BottomNavigationBarItem]
// // widgets, which means it defaults to [BottomNavigationBarType.shifting], and
// // the [currentIndex] is set to index 0. The selected item is amber in color.
// // With each [BottomNavigationBarItem] widget, backgroundColor property is
// // also defined, which changes the background color of [BottomNavigationBar],
// // when that item is selected. The `_onItemTapped` function changes the
// // selected item's index and displays a corresponding message in the center of
// // the [Scaffold].

// import 'package:flutter/material.dart';
// // import 'package:flutter_navigation/Screens/business.dart';
// import 'package:flutter_navigation/Screens/home.dart';
// import 'package:flutter_navigation/Screens/profile.dart';
// import 'package:flutter_navigation/Screens/school.dart';
// import 'package:flutter_navigation/Screens/setting.dart';
// import 'package:flutter_navigation/course_view.dart';
// import 'package:flutter_navigation/drawer_page.dart';
// import 'package:flutter_navigation/main_screen.dart';
// import 'package:hexcolor/hexcolor.dart';
// import 'package:curved_navigation_bar/curved_navigation_bar.dart';

// import 'main.dart';

// /// This is the main application widget.
// class BottomNav extends StatelessWidget {
//   static const String _title = 'Flutter Code Sample';

//   // User Logout Function.

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }

// /// This is the stateful widget that the main application instantiates.
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);

//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }

// class _MyColor {
//   const _MyColor(this.color, this.name);

//   final Color color;
//   final String name;
// }

// /// This is the private State class that goes with MyStatefulWidget.
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _page = 0;

//   GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
//   int _selectedIndex = 0;
//   // ignore: unused_field
//   static const TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   // ignore: non_constant_identifier_names

//   static List<Widget> Screens = [
//     Home(),
//     CourseView(),
//     School(
//       title: 'LIST',
//     ),
//     Profile()
//   ];

//   static List<_MyColor> myBgColors = [
//     const _MyColor(Colors.red, 'Red'),
//     const _MyColor(Colors.blue, 'Light Blue'),
//     const _MyColor(Colors.purple, 'Purple'),
//     const _MyColor(Colors.pink, 'Pink'),
//     const _MyColor(Colors.blue, 'Blue'),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   logout(BuildContext context) {
//     Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Screens.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: CurvedNavigationBar(
//         key: _bottomNavigationKey,
//         height: 60.0,
//         items: <Widget>[
//           Icon(Icons.home, size: 30),
//           Icon(Icons.directions_car_filled_outlined, size: 30),
//           Icon(Icons.school, size: 30),
//           // Icon(Icons.settings, size: 30),
//           Icon(Icons.person, size: 30),
//         ],
//         // HexColor("#3B4254")
//         color: Colors.white,
//         buttonBackgroundColor: Colors.white,
//         backgroundColor: HexColor("#3B4254"),
//         animationCurve: Curves.easeInCubic,
//         animationDuration: Duration(milliseconds: 600),
//         onTap: _onItemTapped,
//         letIndexChange: (index) => true,
//       ),
//     );
//   }
// }
