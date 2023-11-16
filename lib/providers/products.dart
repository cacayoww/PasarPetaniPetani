import 'package:apk_sederhana/models/product.dart';
import 'package:flutter/material.dart';

class Products with ChangeNotifier {
  final List<Product> _allproducts = [];

  List<Product> get allproduct {
    return [..._allproducts];
  }

  List<Product> productsByUserId(id) {
    return _allproducts.where((element) => element.idUser == id).toList();
  }

  Product getProductById(id){
    return _allproducts.firstWhere((element) => element.idProduk == id);
  }

  void addProduct(id, nama, kategori, harga, qty, durasi, berat) {
    _allproducts.add(
      Product(
        idUser: id,
        idProduk: "P${_allproducts.length+1}",
        namaProduk: nama,
        kategori: kategori,
        harga: harga,
        jumlah: qty,
        durasiTahan: durasi,
        berat: berat,
      ),
    );
    notifyListeners();
  }

  int getDiproses(id) {
    int jum = 0;
    var ap = productsByUserId(id);
    ap.forEach((element) {
      if (element.diproses!) {
        jum++;
      }
    });
    return jum;
  }

  int getDiterima(id) {
    int jum = 0;
    var ap = productsByUserId(id);
    ap.forEach((element) {
      if (element.diterima!) {
        jum++;
      }
    });
    return jum;
  }
}
