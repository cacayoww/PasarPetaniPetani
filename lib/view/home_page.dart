// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/user.dart';
import '../widgets/boxpendapatan.dart';
import '../widgets/statistik.dart';
import '../widgets/welcome.dart';


class HomePage extends StatelessWidget {
  static const routeName = '/homepage';
  @override
  Widget build(BuildContext context) {
    final usr = Provider.of<User>(context, listen: false);
    // ignore: unused_local_variable
    final allproducts = Provider.of<Products>(context);
    return Scaffold(
      backgroundColor: Color(0xffF4FBF4),
      body: Column(
        children: [
          Stack(
            children: [
              Welcome(usr: usr),
              BoxPendapatan(usr: usr),
            ],
          ),
          Statistik(usr: usr),
        ],
      ),
    );
  }
}

