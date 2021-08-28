import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_navigation/Screens/admin.dart';
import 'package:flutter_navigation/background.dart';
import 'package:flutter_navigation/bottomnav.dart';
import 'package:flutter_navigation/course_view.dart';

import 'package:flutter_navigation/model/username.dart';
import 'package:hexcolor/hexcolor.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: LoginUser())));
  }
}

class MyDaftar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Center(child: DaftarUser())));
  }
}

class LoginUser extends StatefulWidget {
  LoginUserState createState() => LoginUserState();
}

class LoginUserState extends State {
  bool visible = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  Future userLogin() async {
    setState(() {
      visible = true;
    });

    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;
    NamaUser namauser = new NamaUser(username: email);

    var url =
        Uri.parse('https://lugingaweflutter.000webhostapp.com/login_user.php');

    var data = {'email': email, 'password': password};

    var response = await http.post(url, body: json.encode(data));

    var message = await jsonDecode(response.body);

    if (message == 'Login Matched') {
      setState(() {
        visible = false;
      });

      namauser.username = email;

      if (email == 'admin') {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => School(
                      title: 'Admin Menu',
                    )));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => CourseView(
                      namauser: email,
                    )));
      }
    } else {
      setState(() {
        visible = false;
      });

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

  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(55, 1, 50, 1),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('LOGIN',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: HexColor('#31A559'),
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                  Divider(),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Raleway'),
                        controller: emailController,
                        autocorrect: true,
                        decoration: InputDecoration(
                            hintText: 'Masukkan Username',
                            hintStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Raleway')),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 210,
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Raleway'),
                          validator: (val) =>
                              val!.length < 6 ? 'Password too short.' : null,
                          controller: passwordController,
                          autocorrect: true,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              hintText: 'Masukkan Password',
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'Raleway')),
                        ),
                      ),
                      Container(
                          width: 70,
                          child: new FlatButton(
                            onPressed: _toggle,
                            child: new Text(_obscureText ? "Show" : "Hide",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ))
                    ],
                  ),
                  RaisedButton(
                    onPressed: userLogin,
                    color: HexColor('#31A559'),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child:
                        Text('LOGIN', style: TextStyle(fontFamily: 'Raleway')),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyDaftar()));
                    },
                    child: Text('Belum Punya Akun? Daftar'),
                    textColor: HexColor('#31A559'),
                  ),
                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator())),
                ],
              ),
            ),
          )),
        ],
      ),
    ));
  }
}

class DaftarUser extends StatefulWidget {
  DaftarUserState createState() => DaftarUserState();
}

class DaftarUserState extends State {
  // For CircularProgressIndicator.
  bool visible = false;

  // Getting value from TextField widget.
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  Future userDaftar() async {
    setState(() {
      visible = true;
    });

    String email = emailController.text;
    String password = passwordController.text;
    String username = usernameController.text;

    var url =
        Uri.parse('https://lugingaweflutter.000webhostapp.com/daftar_user.php');

    var data = {'email': email, 'password': password};

    var response = await http.post(url, body: json.encode(data));

    var message = jsonDecode(response.body);

    if (message == 'Daftar Berhasil') {
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
            title: new Text('Daftar Berhasil, Silahkan Login'),
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

  bool _obscureText = true;

  late String _password;

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SingleChildScrollView(
              child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(55, 1, 50, 1),
              child: Column(
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('REGISTER',
                              style: TextStyle(
                                  fontSize: 25,
                                  color: HexColor('#31A559'),
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold)),
                        ],
                      )),
                  Divider(),
                  Container(
                      width: 280,
                      padding: EdgeInsets.all(10.0),
                      child: TextFormField(
                        style: TextStyle(
                            color: Colors.white, fontFamily: 'Raleway'),
                        validator: (val) =>
                            val!.length < 6 ? 'Username too short.' : null,
                        controller: emailController,
                        autocorrect: true,
                        decoration: InputDecoration(
                            hintText: 'Masukkan Username',
                            hintStyle: TextStyle(
                                color: Colors.white, fontFamily: 'Raleway'),
                            focusColor: Colors.white,
                            fillColor: Colors.white),
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 210,
                        padding: EdgeInsets.fromLTRB(10, 10, 0, 10),
                        child: TextFormField(
                          style: TextStyle(
                              color: Colors.white, fontFamily: 'Raleway'),
                          validator: (val) =>
                              val!.length < 6 ? 'Password too short.' : null,
                          controller: passwordController,
                          autocorrect: true,
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                              hintText: 'Masukkan Password',
                              hintStyle: TextStyle(
                                  color: Colors.white, fontFamily: 'Raleway')),
                        ),
                      ),
                      Container(
                          width: 70,
                          child: new FlatButton(
                            onPressed: _toggle,
                            child: new Text(_obscureText ? "Show" : "Hide",
                                style: TextStyle(
                                  color: Colors.white,
                                )),
                          ))
                    ],
                  ),
                  RaisedButton(
                    onPressed: userDaftar,
                    color: HexColor('#31A559'),
                    textColor: Colors.white,
                    padding: EdgeInsets.fromLTRB(9, 9, 9, 9),
                    child: Text(
                      'REGISTER',
                      style: TextStyle(fontFamily: 'Raleway'),
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
                    },
                    child: Text('Sudah Punya Akun? Login'),
                    textColor: HexColor('#31A559'),
                  ),
                  Visibility(
                      visible: visible,
                      child: Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: CircularProgressIndicator())),
                ],
              ),
            ),
          )),
        ],
      ),
    ));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}

class ProfileScreen extends StatelessWidget {
// Creating String Var to Hold sent Email.
  late final String email;

  ProfileScreen({Key? key, required this.email}) : super(key: key);

  // User Logout Function.
  logout(BuildContext context) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
                title: Text('Profile Screen'),
                automaticallyImplyLeading: false),
            body: Center(
                child: Column(
              children: <Widget>[
                Container(
                    width: 280,
                    padding: EdgeInsets.all(10.0),
                    child: Text('Email = ' + '\n' + email,
                        style: TextStyle(fontSize: 20))),
                RaisedButton(
                  onPressed: () {
                    logout(context);
                  },
                  color: Colors.red,
                  textColor: Colors.white,
                  child: Text('Click Here To Logout'),
                ),
              ],
            ))));
  }
}
