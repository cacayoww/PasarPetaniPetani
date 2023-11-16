import 'package:flutter/material.dart';

class Riwayat {
  String? idRiwayat;
  String? idUser;
  String? idProduk;
  String? nama;
  DateTime? waktu;

  Riwayat({
    @required this.idRiwayat,
    @required this.idUser,
    @required this.idProduk,
    @required this.nama,
    @required this.waktu,
  });
}
