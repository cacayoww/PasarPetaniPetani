import 'package:apk_sederhana/models/riwayat.dart';
import 'package:flutter/material.dart';

class AllRiwayat with ChangeNotifier {
  final List<Riwayat> _allriwayat = [];

  List<Riwayat> get allriwayat {
    return [..._allriwayat];
  }

  List<Riwayat> riwayatByUserId(id) {
    return _allriwayat.where((element) => element.idUser == id).toList();
  }

  void addRiwayat(String email,String produk, String nama, DateTime waktu) {
    _allriwayat.add(
      Riwayat(
          idRiwayat: "R${_allriwayat.length - 1}",
          idUser: email,
          idProduk: produk,
          nama: nama,
          waktu: waktu),
    );
    notifyListeners();
  }
}
