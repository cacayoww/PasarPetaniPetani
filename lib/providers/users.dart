import 'package:apk_sederhana/providers/user.dart';
import 'package:flutter/material.dart';

class Users with ChangeNotifier {
  final List<User> _alluser = [
    User(nama: 'Caca Yoww', email: 'caca@gmail.com', alamat: 'Palem Residence 2 A3/7', password: 'cacacaca', profil: 'assets/images/cayoww.jpg', pendapatan: 1000000),
  ];

  List<User> get alluser {
    return [..._alluser];
  }

  User findByEmail(eMail){
    return _alluser.firstWhere((element) => element.email == eMail, orElse: () => User(nama: 'not valid', email: 'not valid', alamat: 'not valid', password: 'not valid', pendapatan: 0),);
  }

  String isPwdTrue(eMail, pwd) {
    User usr = findByEmail(eMail);
    if (usr.email == 'not valid'){
      return 'Email Not Valid';
    }else if (pwd == usr.password!){
      return 'Valid';
    }else{
      return 'Password Not Valid';
    }
  }
}