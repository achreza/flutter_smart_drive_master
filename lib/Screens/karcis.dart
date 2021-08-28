import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class Karcis extends StatelessWidget {
  late String nama, jeniskursus, kesulitan, harga, tanggal;

  Karcis(
      {required this.nama,
      required this.jeniskursus,
      required this.kesulitan,
      required this.harga,
      required this.tanggal});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor("#3B4254"),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(27, 10, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text('Course E-Ticket',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Staatliches',
                          fontWeight: FontWeight.normal,
                          fontSize: 20)),
                ),
                Container(
                  width: 150,
                  height: 100,
                  child: Image.asset(
                    'images/Logo1.png',
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Center(
            child: Text(
              'Kursus ' + jeniskursus,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 22),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 35, 8, 8),
            child: Text(
              'Nama\t\t:\t\t ' + nama,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text(
              'Jenis Kursus\t\t:\t\t ' + jeniskursus,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text(
              'Kesulitan\t\t:\t\t ' + kesulitan,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 8, 8),
            child: Text(
              'Telah Lunas Dibayar Sejumlah\t\t:\t\t ' + harga,
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Divider(
              thickness: 0.2,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 18, 8, 8),
            child: Text(
              'NOTE :',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.normal,
                  fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 8, 8),
            child: Text(
              '- Gunakan E-Ticket ini untuk mengkonfirmasi ke Outlet SmartDriver untuk mendapatkan Jadwal dan Tutor',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.normal,
                  fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 8, 8),
            child: Text(
              '- E-Ticket ini akan hangus jika data di Admin sudah dihapus',
              style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Raleway',
                  fontWeight: FontWeight.normal,
                  fontSize: 13),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Center(
              child: Container(
                  width: 100,
                  height: 100,
                  child: Image.asset('images/ttd.png')),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Owner Smart Drive',
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(2.0),
              child: Text(
                tanggal,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
              child: Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: Colors.white.withOpacity(0.5),
                    size: 40,
                  )),
              Text(
                'Back',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.5),
                    fontFamily: 'Raleway',
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
