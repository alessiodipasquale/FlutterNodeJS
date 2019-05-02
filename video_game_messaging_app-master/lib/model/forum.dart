import 'package:video_game_message_board_app/model/topic.dart';

class Forum {
  
  final String titolo;
  final String nazione;
  final int anno;
  final String durata;
  final String genere;
  final String regia;
  final String produzione;
  final String data;
  final String imgURL;
  final String cast;
  final String trama;
  final String trailerURL;
  final String news;

  Forum(this.titolo, this.nazione, this.anno, this.durata, this.genere, this.regia, this.produzione, this.data, this.imgURL, this.cast, this.trama, this.trailerURL, this.news);
  

  
}

final fortniteForum = Forum(
  "Interstellar",
    "USA",
    2013,
     "170'",
  "Fantascienza",
    "C. Nolan",
   "fdfgfdd",
     "01/05/2019",
    "/assets/images/interstellar.jpg",
    "cioa",
    "ddsjds",
    "sdadksaksd",
   "no",);

final pubgForum = Forum(
     "Interstellar",
    "USA",
    2013,
     "170'",
  "Fantascienza",
    "C. Nolan",
   "fdfgfdd",
     "01/05/2019",
    "/assets/images/interstellar.jpg",
    "cioa",
    "ddsjds",
    "sdadksaksd",
   "no",);

final forums = [
  fortniteForum,
  pubgForum
];
