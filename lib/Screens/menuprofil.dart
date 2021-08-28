import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_navigation/Screens/profile.dart';
import 'package:flutter_navigation/drawer_page.dart';
import 'package:flutter_navigation/model/character.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';

logout(BuildContext context) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => MyApp()));
}

class MenuProfile extends StatefulWidget {
  late String namauser;

  MenuProfile({required this.namauser});

  @override
  _MenuProfileState createState() => _MenuProfileState(namauser: namauser);
}

class _MenuProfileState extends State<MenuProfile> {
  late String namauser;

  _MenuProfileState({required this.namauser});

  StreamController<List> _streamController = StreamController<List>();
  List<Character> characterList = <Character>[];
  late Timer _timer;
  bool visible = false;

  Future getData() async {
    var url =
        Uri.parse('https://lugingaweflutter.000webhostapp.com/getConfirm.php');
    // var dataisi = {'namauser': namauser};

    // Starting Web API Call.
    http.Response response = await http.get(url);

    List data = json.decode(response.body);
    print(data);
    // characterList = data.map((model) => Character.fromJson(model)).toList();

    //Add your data to stream

    setState(() {
      for (Map i in data) {
//menambahkan data yang sudah berhasil di get ke list model
        characterList.add(Character.fromJson(i));
      }
//proses get data berhasil , loading di set false
    });
    _streamController.add(data);
  }

  @override
  void initState() {
    getData();

    //Check the server every 5 seconds
    _timer = Timer.periodic(Duration(seconds: 5), (timer) => getData());

    super.initState();
  }

  @override
  void dispose() {
    //cancel the timer
    if (_timer.isActive) _timer.cancel();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerPage(
          namauser: widget.namauser,
        ),
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(fontFamily: 'Staatliches'),
          ),
          centerTitle: true,
          backgroundColor: HexColor("#3B4254"),
        ),
        body: Padding(
          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(9)),
                      child: Image.asset(
                        'images/08.jpg',
                      )),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 70, 0, 0),
                    child: Center(
                      child: Container(
                        width: 130,
                        height: 130,
                        child: CircleAvatar(
                          backgroundColor: Colors.white.withOpacity(0.8),
                          child: Icon(
                            Icons.person,
                            size: 100,
                            color: HexColor("#3B4254"),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 205, 0, 0),
                    child: Center(
                      child: Text(namauser,
                          style: TextStyle(
                              fontFamily: 'Raleway',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30)),
                    ),
                  ),
                ],
              ),
              Divider(
                thickness: 0.5,
              ),
              Expanded(
                  flex: 1,
                  child: Center(
                      child: Text("DAFTAR COURSE YANG DIPILIH :",
                          style: TextStyle(
                              color: HexColor("#3B4254"),
                              fontSize: 15,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.bold)))),
              Expanded(flex: 7, child: Profile(namauser: namauser))
            ],
          ),
        ));
  }
}
