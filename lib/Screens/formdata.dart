import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:hexcolor/hexcolor.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:square_in_app_payments/in_app_payments.dart';
import 'package:square_in_app_payments/models.dart';

class FormData extends StatefulWidget {
  String namauser;
  String jeniskursus, kesulitan, harga;
  FormData(
      {Key? key,
      required this.namauser,
      required this.jeniskursus,
      required this.kesulitan,
      required this.harga})
      : super(key: key);

  @override
  _FormDataState createState() => _FormDataState(
      namauser: namauser,
      jeniskursus: jeniskursus,
      kesulitan: kesulitan,
      harga: harga);
}

class _FormDataState extends State<FormData> {
  late String namauser;
  late String jeniskursus, kesulitan, harga;
  _FormDataState(
      {required this.namauser,
      required this.jeniskursus,
      required this.kesulitan,
      required this.harga});
  List<String> attachments = [];
  bool isHTML = false;
  bool visible = false;

  Future userDaftar() async {
    // Showing CircularProgressIndicator.
    setState(() {
      visible = true;
    });

    // SERVER LOGIN API URL
    var url = Uri.parse(
        'https://lugingaweflutter.000webhostapp.com/confirm_course.php');

    // Store all data with Param Name.
    var data = {
      'email': _recipientController.text,
      'namauser': namauser,
      'jeniskursus': jeniskursus,
      'kesulitan': kesulitan,
      'harga': harga,
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
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title:
                new Text('Daftar Kursus Berhasil, Silahkan Tunggu Konfirmasi'),
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

  final _recipientController = TextEditingController(
    text: 'emailanda@gmail.com',
  );

  final _subjectController = TextEditingController(text: 'The subject');

  final _bodyController = TextEditingController(
    text: 'Mail body.',
  );

  late int _counter;

  void _pay() {
    InAppPayments.setSquareApplicationId(
        'sandbox-sq0idb-Yv7dsSIwwaPm1vjGZayy3A');
    InAppPayments.startCardEntryFlow(
      onCardEntryCancel: _cardEntryCancel,
      onCardNonceRequestSuccess: _cardNonceRequestSuccess,
    );
  }

  void _cardEntryCancel() {
    // Cancel
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text('Pembayaran Gagal'),
          actions: <Widget>[
            FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    // Use this nonce from your backend to pay via Square API
    print(result.nonce);

    final bool _invalidZipCode = false;

    if (_invalidZipCode) {
      // Stay in the card flow and show an error:
      InAppPayments.showCardNonceProcessingError('Invalid ZipCode');
    }

    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete() {
    // Success
    userDaftar();
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor("#3B4254"),
        title: Text('Form Konfirmasi Kursus'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                controller: _recipientController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Masukkan Email anda',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: _pay,
                color: HexColor("#3B4254"),
                textColor: Colors.white,
                padding: EdgeInsets.fromLTRB(20, 9, 20, 9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.payment),
                    Text(
                      ' Bayar Kursus Sejumlah ' + harga,
                    )
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: TextField(
            //     controller: _subjectController,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(),
            //       labelText: 'Subject',
            //     ),
            //   ),
            // ),
            // Expanded(
            //   child: Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: TextField(
            //       controller: _bodyController,
            //       maxLines: null,
            //       expands: true,
            //       textAlignVertical: TextAlignVertical.top,
            //       decoration: InputDecoration(
            //           labelText: 'Body', border: OutlineInputBorder()),
            //     ),
            //   ),
            // ),
            // CheckboxListTile(
            //   contentPadding:
            //       EdgeInsets.symmetric(vertical: 0.0, horizontal: 8.0),
            //   title: Text('HTML'),
            //   onChanged: (bool? value) {
            //     if (value != null) {
            //       setState(() {
            //         isHTML = value;
            //       });
            //     }
            //   },
            //   value: isHTML,
            // ),
            // Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Column(
            //     children: <Widget>[
            //       for (var i = 0; i < attachments.length; i++)
            //         Row(
            //           children: <Widget>[
            //             Expanded(
            //               child: Text(
            //                 attachments[i],
            //                 softWrap: false,
            //                 overflow: TextOverflow.fade,
            //               ),
            //             ),
            //             IconButton(
            //               icon: Icon(Icons.remove_circle),
            //               onPressed: () => {_removeAttachment(i)},
            //             )
            //           ],
            //         ),
            //       Align(
            //         alignment: Alignment.centerRight,
            //         child: IconButton(
            //           icon: Icon(Icons.attach_file),
            //           onPressed: () {},
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void _removeAttachment(int index) {
    setState(() {
      attachments.removeAt(index);
    });
  }
}
