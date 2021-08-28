import 'dart:async';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_navigation/drawer_page.dart';
import 'package:flutter_navigation/model/character.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../main.dart';
import 'karcis.dart';

logout(BuildContext context) {
  Navigator.pop(context, MaterialPageRoute(builder: (context) => MyApp()));
}

class Profile extends StatefulWidget {
  late String namauser;

  Profile({required this.namauser});

  @override
  _ProfileState createState() => _ProfileState(namauser: namauser);
}

class _ProfileState extends State<Profile> {
  late String namauser;

  _ProfileState({required this.namauser});

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

    List data = await json.decode(response.body);
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
      // appBar: AppBar(
      //   title: Text(
      //     'Profile',
      //     style: TextStyle(fontFamily: 'Staatliches'),
      //   ),
      //   centerTitle: true,
      //   backgroundColor: HexColor("#3B4254"),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          decoration: BoxDecoration(
              // color: HexColor("#3B4254"),
              borderRadius: BorderRadius.circular(8)),
          child: StreamBuilder<List>(
            stream: _streamController.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData)
                return ListView(
                  children: [
                    for (Map document in snapshot.data)
                      if (document['nama'] == namauser)
                        Card(
                          color: HexColor("#3B4254"),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Karcis(
                                            nama: document['nama'],
                                            jeniskursus:
                                                document['jeniskursus'],
                                            kesulitan: document['kesulitan'],
                                            harga: document['harga'],
                                            tanggal: document['tanggal'],
                                          )));
                            },
                            title: Text(
                              'Tanggal ' + document['tanggal'],
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'Raleway'),
                            ),
                            subtitle: Text(
                                document['jeniskursus'] +
                                    ' Tingkat ' +
                                    document['kesulitan'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Raleway')),
                            selectedTileColor: HexColor("#3B4254"),
                            hoverColor: HexColor("#3B4254"),
                            trailing: Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                          ),
                        ),
                  ],
                );
              return Center(child: Text('Loading...'));
            },
          ),
        ),
      ),
    );
  }
}
