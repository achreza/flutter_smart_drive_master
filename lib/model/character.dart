import 'dart:convert';

// Future<List<Character>> fetchPosts() async {
//   var url =
//       Uri.parse('https://lugingaweflutter.000webhostapp.com/login_user.php');

//   // Store all data with Param Name.
//   var data = {'email': email, 'password': password};

//   // Starting Web API Call.
//   var response = await http.post(url, body: json.encode(data));

//   // Getting Server response into variable.
//   var responseJson = jsonDecode(response.body);
// }

import 'dart:convert';

List<Character> modelUsersFromJson(String str) =>
    List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

String modelUsersToJson(List<Character> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Character {
  Character(
      {required this.tanggal,
      required this.email,
      required this.kesulitan,
      required this.namauser,
      required this.harga,
      required this.jeniskursus});

  String tanggal;
  String email;
  String kesulitan;
  String namauser;
  String jeniskursus;
  String harga;

  Character.fromJson(Map json)
      : tanggal = json['tanggal'],
        email = json['email'],
        kesulitan = json['kesulitan'],
        namauser = json['nama'],
        jeniskursus = json['jeniskursus'],
        harga = json['harga'];

  Map toJson() {
    return {
      'tanggal': tanggal,
      'email': email,
      'kesulitan': kesulitan,
      'nama': namauser,
      'jeniskursus': jeniskursus,
      'harga': harga,
    };
  }
}
