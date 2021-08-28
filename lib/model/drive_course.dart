import 'package:flutter/material.dart';

class Course {
  String name;
  String difficulty;
  String description;
  String icon;
  String openTime;
  String ticketPrice;
  String imageAsset;
  IconData logo;
  List<String> imageUrls;
  Color color;

  Course({
    required this.name,
    required this.difficulty,
    required this.description,
    required this.icon,
    required this.openTime,
    required this.ticketPrice,
    required this.imageAsset,
    required this.imageUrls,
    required this.logo,
    required this.color,
  });
}

var courseList = [
  Course(
    color: Colors.green,
    name: 'Mobil',
    difficulty: 'Pemula',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, apalagi untuk kendaraan roda empat seperti mobil. Berbeda dengan sepeda motor, mengendarai mobil diperlukan keterampilan yang lebih karena ukuran kendaraan yang Anda kemudikan lebih besar dan teknik mengendarainya lebih rumit. ',
    icon: 'Open Everyday',
    openTime: '09:00 - 20:00',
    ticketPrice: 'Rp 250.000',
    imageAsset: 'images/farm-house.jpg',
    logo: Icons.directions_car_filled_outlined,
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/f0/22/f6/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-m/1280/16/a9/33/43/liburan-di-farmhouse.jpg'
    ],
  ),
  Course(
    color: Colors.amber,
    logo: Icons.directions_car_filled_outlined,
    name: 'Mobil',
    difficulty: 'Menengah',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, apalagi untuk kendaraan roda empat seperti mobil. Berbeda dengan sepeda motor, mengendarai mobil diperlukan keterampilan yang lebih karena ukuran kendaraan yang Anda kemudikan lebih besar dan teknik mengendarainya lebih rumit. ',
    icon: 'Open Tuesday - Saturday',
    openTime: '09:00 - 14:30',
    ticketPrice: 'Rp 350.000',
    imageAsset: 'images/bosscha.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/12/6b/63/0b/bosscha-observatory.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-p/0d/6a/88/9b/photo3jpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/11/3f/04/39/p-20171111-110220-largejpg.jpg',
    ],
  ),
  Course(
    color: Colors.red,
    logo: Icons.directions_car_filled_outlined,
    name: 'Mobil',
    difficulty: 'Ahli',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, apalagi untuk kendaraan roda empat seperti mobil. Berbeda dengan sepeda motor, mengendarai mobil diperlukan keterampilan yang lebih karena ukuran kendaraan yang Anda kemudikan lebih besar dan teknik mengendarainya lebih rumit. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 500.000',
    imageAsset: 'images/jalan-asia-afrika.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/0d/c2/e7/e6/quotes-kota-bandung.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/17/f4/44/01/jalan-asia-afrika.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/0a/ef/36/e2/jalan-asia-afrika.jpg',
    ],
  ),
  Course(
    color: Colors.green,
    logo: Icons.two_wheeler,
    name: 'Sepeda',
    difficulty: 'Pemula',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, Untuk Sepeda motor juga kita tidak bisa mengentengkan pelajaran ini, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Roda Dua. ',
    icon: 'Open Everyday',
    openTime: '06:00 - 17:00',
    ticketPrice: 'Rp 150.000',
    imageAsset: 'images/stone-garden.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/15/01/d7/4b/p-20180510-153310-01.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/15/68/00/32/stone-garden-citatah.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/0d/a2/cb/05/stone-garden-citatah.jpg',
    ],
  ),
  Course(
    color: Colors.amber,
    logo: Icons.two_wheeler,
    name: 'Sepeda',
    difficulty: 'Menengah',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, Untuk Sepeda motor juga kita tidak bisa mengentengkan pelajaran ini, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Roda Dua. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 250.000',
    imageAsset: 'images/taman-film.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/08/8b/87/50/bandung-movie-park.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/17/67/d5/53/img-20190505-114509-largejpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/09/73/33/05/taman-film-pasopati.jpg',
    ],
  ),
  Course(
    color: Colors.red,
    logo: Icons.two_wheeler,
    name: 'Sepeda',
    difficulty: 'Ahli',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, Untuk Sepeda motor juga kita tidak bisa mengentengkan pelajaran ini, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Roda Dua. ',
    icon: 'Open Saturday - Thursday',
    openTime: '09:00 - 15:30',
    ticketPrice: 'Rp 400.000',
    imageAsset: 'images/museum-geologi.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-w/19/1c/8e/f7/geology-museum.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/11/a7/35/b7/geology-museum.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-s/1a/55/e0/dc/geology-museum.jpg',
    ],
  ),
  Course(
    color: Colors.green,
    logo: Icons.directions_bus_filled_outlined,
    name: 'Kendaraan Berat',
    difficulty: 'Mudah',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, Uutuk Kendaraan Besar seperti Truk, Bus, Kontainer dan lainnya Memang diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Besar tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Berat. ',
    icon: 'Open Everyday',
    openTime: '09:00 - 17:00',
    ticketPrice: 'Rp 750.000',
    imageAsset: 'images/floating-market.png',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/17/f9/ff/f8/floating-market-bandung.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-p/1a/86/d3/cd/20200103-125059-largejpg.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-p/19/ce/b4/9b/img20181224120857-largejpg.jpg',
    ],
  ),
  Course(
    color: Colors.amber,
    logo: Icons.directions_bus_filled_outlined,
    name: 'Kendaraan Berat',
    difficulty: 'Menengah',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, Uutuk Kendaraan Besar seperti Truk, Bus, Kontainer dan lainnya Memang diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Besar tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Berat. ',
    icon: 'Open Everyday',
    openTime: '07:00 - 17:00',
    ticketPrice: 'Rp 1.000.000',
    imageAsset: 'images/kawah-putih.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/0b/6e/7c/ce/rocks-sticking-out-of.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-p/0b/35/30/14/white-crater.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-o/0a/8b/9a/79/2945-t00572-www-initempatwisat.jpg',
    ],
  ),
  Course(
    color: Colors.red,
    logo: Icons.directions_bus_filled_outlined,
    name: 'Kendaraan Berat',
    difficulty: 'Ahli',
    description:
        'Mengendarai kendaraan bermotor memang tidak bisa sembarangan, Uutuk Kendaraan Besar seperti Truk, Bus, Kontainer dan lainnya Memang diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Besar tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Berat. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 1.500.000',
    imageAsset: 'images/ranca-upas.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/1a/e0/7f/9c/kampung-cai-ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/2f/87/ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/27/0a/ranca-upas.jpg',
    ],
  ),
  Course(
    color: Colors.green,
    logo: Icons.airplanemode_active,
    name: 'Pesawat',
    difficulty: 'Pemula',
    description:
        'Mengendarai kendaraan udara memang tidak bisa sembarangan, Uutuk Kendaraan Udara seperti Pesawat atau helikopter diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Udara tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Udara. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 5.000.000',
    imageAsset: 'images/ranca-upas.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/1a/e0/7f/9c/kampung-cai-ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/2f/87/ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/27/0a/ranca-upas.jpg',
    ],
  ),
  Course(
    color: Colors.amber,
    logo: Icons.airplanemode_active,
    name: 'Pesawat',
    difficulty: 'Menengah',
    description:
        'Mengendarai kendaraan udara memang tidak bisa sembarangan, Uutuk Kendaraan Udara seperti Pesawat atau helikopter diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Udara tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Udara. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 5.000.000',
    imageAsset: 'images/ranca-upas.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/1a/e0/7f/9c/kampung-cai-ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/2f/87/ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/27/0a/ranca-upas.jpg',
    ],
  ),
  Course(
    color: Colors.red,
    logo: Icons.airplanemode_active,
    name: 'Pesawat',
    difficulty: 'Ahli',
    description:
        'Mengendarai kendaraan udara memang tidak bisa sembarangan, Uutuk Kendaraan Udara seperti Pesawat atau helikopter diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Udara tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Udara. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 5.000.000',
    imageAsset: 'images/ranca-upas.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/1a/e0/7f/9c/kampung-cai-ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/2f/87/ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/27/0a/ranca-upas.jpg',
    ],
  ),
  Course(
    color: Colors.green,
    logo: Icons.water,
    name: 'Kapal Laut',
    difficulty: 'Pemula',
    description:
        'Mengendarai kendaraan Laut memang tidak bisa sembarangan, Untuk Kendaraan Laut seperti Kapal Laut diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Laut tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Laut. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 4.000.000',
    imageAsset: 'images/ranca-upas.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/1a/e0/7f/9c/kampung-cai-ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/2f/87/ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/27/0a/ranca-upas.jpg',
    ],
  ),
  Course(
    color: Colors.amber,
    logo: Icons.water,
    name: 'Kapal Laut',
    difficulty: 'Menengah',
    description:
        'Mengendarai kendaraan Laut memang tidak bisa sembarangan, Untuk Kendaraan Laut seperti Kapal Laut diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Laut tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Laut. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 4.000.000',
    imageAsset: 'images/ranca-upas.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/1a/e0/7f/9c/kampung-cai-ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/2f/87/ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/27/0a/ranca-upas.jpg',
    ],
  ),
  Course(
    color: Colors.red,
    logo: Icons.water,
    name: 'Kapal Laut',
    difficulty: 'Ahli',
    description:
        'Mengendarai kendaraan Laut memang tidak bisa sembarangan, Untuk Kendaraan Laut seperti Kapal Laut diperlukan Kemampuan yang Ekstra dalam Berkendara dengan Kendaraan Laut tersebut, Tidak ada salahnya jikalau kita mengikuti kursus ini Untuk Mendalami Ketrampilan kita dalam mengendarai Kendaraan Laut. ',
    icon: 'Open Everyday',
    openTime: '24 hours',
    ticketPrice: 'Rp 4.000.000',
    imageAsset: 'images/ranca-upas.jpg',
    imageUrls: [
      'https://media-cdn.tripadvisor.com/media/photo-o/1a/e0/7f/9c/kampung-cai-ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/2f/87/ranca-upas.jpg',
      'https://media-cdn.tripadvisor.com/media/photo-w/13/ee/27/0a/ranca-upas.jpg',
    ],
  ),
];
