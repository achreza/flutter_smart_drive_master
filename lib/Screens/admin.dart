import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_navigation/draweadmin.dart';
import 'package:flutter_navigation/model/character.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class School extends StatefulWidget {
  School({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _SchoolState createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  StreamController<List> _streamController = StreamController<List>();
  List<Character> characterList = <Character>[];
  late Timer _timer;
  bool visible = false;

  Future getData() async {
    var url =
        Uri.parse('https://lugingaweflutter.000webhostapp.com/getConfirm.php');
    http.Response response = await http.get(url);
    List data = await json.decode(response.body);
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

  final _recipientController = TextEditingController(
    text: 'example@example.com',
  );

  List<String> attachments = [];
  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  Future<void> send(String namauser, String jeniskursus, String kesulitan,
      String harga, String kirimemail) async {
    final String isi = 'Peserta Kursus Atas Nama ' +
        namauser +
        '\n Mengambil jenis Kursus : ' +
        jeniskursus +
        '\n dengan Tingkat Kesulitan : ' +
        kesulitan +
        '\n Dengan ini Sudah Dikonfirmasi Telah Membayar Membayar sejumlah : ' +
        harga +
        '\n\n\n Salam Hangat dari Kami \n Smart Drive App';
    final Email email = Email(
      body: isi,
      subject: 'Smart Driver Verification Mail',
      recipients: [kirimemail],
      attachmentPaths: attachments,
      isHTML: false,
    );

    String platformResponse;

    try {
      await FlutterEmailSender.send(email);
      platformResponse = 'Success';
    } catch (error) {
      platformResponse = error.toString();
    }

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(platformResponse),
      ),
    );
  }

  Future userDelete(String namauser, String jkursus, String kesulitans) async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // Getting value from Controller
    String nama = namauser;
    String jeniskursus = jkursus;
    String kesulitan = kesulitans;

    // SERVER LOGIN API URL
    var url =
        Uri.parse('https://lugingaweflutter.000webhostapp.com/deleteTest.php');

    // Store all data with Param Name.
    var data = {
      'namauser': nama,
      'jeniskursus': jeniskursus,
      'kesulitan': kesulitan
    };

    // Starting Web API Call.
    var response = await http.post(url, body: json.encode(data));

    // Getting Server response into variable.
    var message = jsonDecode(response.body);

    // If the Response Message is Matched.
    if (message == 'Login Matched') {
      // Hiding the CircularProgressIndicator.
      setState(() {
        visible = false;
      });

      // Navigate to Profile Screen & Sending Email to Next Screen.

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
      appBar: AppBar(
        backgroundColor: HexColor("#3B4254"),
        title: Text("ADMIN MENU", style: TextStyle(fontFamily: 'Staatliches')),
      ),
      drawer: DrawerPageAdmin(),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(1, 15, 1, 1),
        child: Container(
          child: StreamBuilder<List>(
            stream: _streamController.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData)
                return ListView(
                  children: [
                    for (Map document in snapshot.data)
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        color: HexColor("#3B4254"),
                        child: ListTile(
                          onTap: () {
                            send(
                                document['nama'],
                                document['jeniskursus'],
                                document['kesulitan'],
                                document['harga'],
                                document['email']);
                          },
                          onLongPress: () {
                            userDelete(document['nama'],
                                document['jeniskursus'], document['kesulitan']);
                          },
                          title: Text(
                            document['nama'] + ' at ' + document['tanggal'],
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            document['jeniskursus'] +
                                ' Tingkat ' +
                                document['kesulitan'] +
                                ' ( ' +
                                document['harga'] +
                                ' ) ',
                            style: TextStyle(
                                color: Colors.white, fontFamily: 'Raleway'),
                          ),
                          selectedTileColor: HexColor("#3B4254"),
                          hoverColor: HexColor("#3B4254"),
                          trailing: Icon(
                            Icons.mail_outline_outlined,
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
