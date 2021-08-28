import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../drawer_page.dart';
import '../main.dart';

class Home extends StatelessWidget {
  late String namauser;

  Home({required this.namauser});
  logout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(
        namauser: namauser,
      ),
      appBar: AppBar(
        backgroundColor: HexColor("#3B4254"),
        title: Text(
          'Dashboard',
          style: TextStyle(fontFamily: 'Staatliches'),
        ),
      ),
      body: Container(
        color: HexColor("#3B4254"),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
          child: Column(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
                clipBehavior: Clip.antiAlias,
                color: Colors.white,
                elevation: 5.0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 22.0),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Total Views',
                              style: TextStyle(
                                  fontFamily: 'Staatliches',
                                  color: Colors.redAccent,
                                  fontSize: 17),
                            ),
                            Text(
                              '270K',
                              style: TextStyle(
                                  fontSize: 30, fontFamily: 'Staatliches'),
                            )
                          ],
                        ),
                        Image.network(
                          'https://cdn.pixabay.com/photo/2016/11/19/03/08/youtube-1837872_960_720.png',
                          height: 70,
                          width: 60,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 18, 0, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 170,
                      child: Expanded(
                        flex: 5,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          clipBehavior: Clip.antiAlias,
                          color: Colors.white,
                          elevation: 5.0,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 22.0),
                            child: Column(
                              children: [
                                Image.network(
                                  'https://cdn.pixabay.com/photo/2016/11/19/03/08/youtube-1837872_960_720.png',
                                  height: 70,
                                  width: 60,
                                ),
                                Text(
                                  'General',
                                  style: TextStyle(
                                      fontFamily: 'Staatliches', fontSize: 30),
                                ),
                                Text('Images Videos')
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 5.0),
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        elevation: 5.0,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 22.0),
                          child: Column(
                            children: [
                              Image.network(
                                'https://cdn.iconscout.com/icon/free/png-512/notification-ui-alarm-bell-round-notice-remind-reminder-13462.png',
                                height: 70,
                                width: 60,
                              ),
                              Text(
                                'Notification',
                                style: TextStyle(
                                    fontFamily: 'Staatliches', fontSize: 30),
                              ),
                              Text('Images Videos')
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
