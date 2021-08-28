import 'package:flutter/material.dart';
import 'package:flutter_navigation/detail_course.dart';

import 'package:flutter_navigation/model/drive_course.dart';

import 'package:hexcolor/hexcolor.dart';

import 'drawer_page.dart';

class CourseView extends StatelessWidget {
  late String namauser;

  CourseView({required this.namauser});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        namauser: namauser,
      ),
      appBar: AppBar(
        title: Text(
          'Course',
          style: TextStyle(fontFamily: 'Staatliches'),
        ),
        centerTitle: true,
        backgroundColor: HexColor("#3B4254"),
      ),
      backgroundColor: HexColor("#3B4254"),
      body: Padding(
        padding: EdgeInsets.fromLTRB(8, 20, 8, 8),
        child: ListView(
          children: courseList.map((course) {
            // ignore: deprecated_member_use
            return FlatButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DetailCourse(
                      course: course,
                      namauser: namauser,
                    );
                  }));
                },
                child: Container(
                  height: 100,
                  child: Card(
                    color: HexColor("#424B5E"),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                              child: Icon(
                            course.logo,
                            size: 50,
                            color: Colors.white60,
                          )),
                        ),
                        Expanded(
                          flex: 0,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(0, 22, 10, 0),
                                child: Container(
                                  color: Colors.white,
                                  height: 50,
                                  width: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.fromLTRB(8, 20, 8, 1),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  course.name,
                                  style: TextStyle(
                                      fontSize: 17.0,
                                      fontFamily: 'Raleway',
                                      color: Colors.white54),
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 25,
                                      child: LinearProgressIndicator(
                                        backgroundColor: Colors.white,
                                        color: course.color.withOpacity(0.7),
                                        value: 10,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Text(
                                      course.difficulty,
                                      style: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                            child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white70,
                        ))
                      ],
                    ),
                  ),
                ));
          }).toList(),
        ),
      ),
    );
  }
}
