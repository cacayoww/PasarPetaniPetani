// ignore_for_file: deprecated_member_use, missing_required_param, use_key_in_widget_constructors, prefer_const_constructors

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import './providers/allriwayat.dart';
import './providers/allstatus.dart';
import './providers/products.dart';
import './providers/user.dart';
import './providers/users.dart';
import './providers/status.dart';
import 'view/addproduct_page.dart';
import 'view/home_page.dart';
import 'view/main_screen.dart';
import 'view/product_page.dart';
import 'view/profile_page.dart';
import 'view/riwayat_page.dart';
import 'view/detailproduk_page.dart';
import 'view/editprofile_page.dart';
import 'view/login_page.dart';
import './widgets/materialcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(create: (context) => Products()),
        ChangeNotifierProvider(create: (context) => User()),
        ChangeNotifierProvider(create: (context) => AllStatus(),),
        ChangeNotifierProvider(create: (context) => Status(),),
        ChangeNotifierProvider(create: (context) => AllRiwayat(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        theme: ThemeData(
          primarySwatch: buildMaterialColor(Color(0xFF62C172)),
          fontFamily: 'Poppins',
          textTheme: const TextTheme(
            headline1: TextStyle(
                fontSize: 32,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            headline2: TextStyle(
                fontSize: 24,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            headline3: TextStyle(
                fontSize: 20,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            headline4: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            headline5: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            bodyText1: TextStyle(
                fontSize: 16,
                color: Colors.black,
                fontWeight: FontWeight.normal),
            bodyText2: TextStyle(
                fontSize: 14,
                color: Colors.black,
                fontWeight: FontWeight.normal),
          ),
        ),
        home:  LoginPage(),
        routes: {
          HomePage.routeName: (context) => HomePage(),
          LoginPage.routeName: (context) => LoginPage(),
          MainScreen.routeName: (context) => MainScreen(),
          ProductPage.routeName: (context) => ProductPage(),
          RiwayatPage.routeName: (context) => RiwayatPage(),
          ProfilePage.routeName: (context) => ProfilePage(),
          AddProduct.routeName: (context) => AddProduct(),
          DetailProduk.routeName:(context) => DetailProduk(),
          EditProfile.routeName: (context) => EditProfile()
        },
      ),
    );
  }
}
