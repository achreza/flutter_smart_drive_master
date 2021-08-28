import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../drawer_page.dart';

class Kontak extends StatelessWidget {
  late String namauser;

  Kontak({required this.namauser});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          drawer: DrawerPage(namauser: namauser),
          appBar: AppBar(
            title: Text(
              'ABOUT US',
              style: TextStyle(fontFamily: 'Staatliches'),
            ),
            centerTitle: true,
            backgroundColor: HexColor("#3B4254"),
          ),
          backgroundColor: HexColor("#3B4254"),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.asset('images/Logo1.png')),
              Center(
                child: Text('Contact Us',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.email_outlined,
                          size: 50,
                          color: Colors.green,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'smartdriveofficial@gmail.com',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Raleway'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.facebook_outlined,
                          size: 50,
                          color: Colors.green,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Smart Drive Official',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Raleway'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.phone_android_outlined,
                          size: 50,
                          color: Colors.green,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        '+62 xxxxxxxxxxxx',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Raleway'),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        child: Icon(
                          Icons.web_rounded,
                          size: 50,
                          color: Colors.green,
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'smartdrive.com',
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Raleway'),
                      ),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
