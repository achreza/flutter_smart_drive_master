import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_navigation/Screens/forumchat.dart';
import 'package:flutter_navigation/drawer_page.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:http/http.dart' as http;

class MenuForum extends StatefulWidget {
  String namauser;

  MenuForum({required this.namauser});
  @override
  _MenuForumState createState() => _MenuForumState(namauser: namauser);
}

class _MenuForumState extends State<MenuForum> {
  String namauser;
  bool visible = false;
  _MenuForumState({required this.namauser});
  final chatController = TextEditingController();

  Future userDaftar() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    var url = Uri.parse('https://lugingaweflutter.000webhostapp.com/chat.php');

    // Store all data with Param Name.
    var data = {
      'namauser': namauser,
      'chat': chatController.text,
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = await jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Berhasil Daftar, Silahkan Tunggu Konfirmasi') {
      // Hiding the CircularProgressIndicator.

      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => BottomNav()));
      // showDialog(
      //   context: context,
      //   builder: (BuildContext context) {
      //     return AlertDialog(
      //       title:
      //           new Text('Daftar Kursus Berhasil, Silahkan Tunggu Konfirmasi'),
      //       actions: <Widget>[
      //         FlatButton(
      //           child: new Text("OK"),
      //           onPressed: () {
      //             Navigator.of(context).pop();
      //           },
      //         ),
      //       ],
      //     );
      //   },
      // );
    } else {
      // If Email or Password did not Matched.
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Showing Alert Dialog with Response JSON Message.
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: new Text(message),
            actions: <Widget>[
              FlatButton(
                child: new Text("OK"),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(namauser: namauser),
      appBar: AppBar(
        title: Text(
          'FORUM CHAT',
          style: TextStyle(fontFamily: 'Staatliches'),
        ),
        centerTitle: true,
        backgroundColor: HexColor("#3B4254"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Forum(namauser: namauser),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        controller: chatController,
                        autocorrect: true,
                        decoration: InputDecoration(hintText: 'Masukkan Chat'),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        userDaftar();
                      },
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                      child: Row(
                        children: [
                          Icon(Icons.send_to_mobile_outlined),
                          Text('KIRIM')
                        ],
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
