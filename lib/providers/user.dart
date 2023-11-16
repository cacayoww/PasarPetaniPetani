import 'package:flutter/material.dart';

class User with ChangeNotifier {
  String? nama;
  String? email;
  String? alamat;
  String? password;
  String? noTelp;
  String? profil;
  double? pendapatan;

  User({
    @required this.nama,
    @required this.email,
    @required this.alamat,
    @required this.password,
    @required this.pendapatan,
    this.noTelp = '',
    this.profil = '',
  });

  void editProfil(String nama, String alamat, String password, String noTelp) {
    this.nama = nama;
    this.alamat = alamat;
    if (password != ''){
      this.password = password;
    }
    this.noTelp = noTelp;
    notifyListeners();
  }

  bool isPwdTrue(String pwd){
    return password == pwd;
  }
}
