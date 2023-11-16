import 'package:flutter/material.dart';

class Product {
  String idUser;
  String? idProduk;
  String? namaProduk;
  String? kategori;
  String? imageUrl;
  double? harga;
  int? jumlah;
  String? durasiTahan;
  double? berat;
  bool? diterima;
  bool? diproses;

  Product({
    required this.idUser,
    @required this.idProduk,
    @required this.namaProduk,
    @required this.kategori,
    @required this.harga,
    @required this.jumlah,
    @required this.durasiTahan,
    @required this.berat,
    this.imageUrl = 'assets/images/produkimage.jpg',
    this.diterima = false,
    this.diproses = true
  });

}