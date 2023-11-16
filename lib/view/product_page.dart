// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/user.dart';
import '../widgets/itemproduk.dart';

class ProductPage extends StatelessWidget {
  static const routeName = '/productpage';
  @override
  Widget build(BuildContext context) {
    final usr = Provider.of<User>(context, listen: false);
    final userproduct =
        Provider.of<Products>(context).productsByUserId(usr.email);
    
    return Scaffold(
      backgroundColor: Color(0xffF4FBF4),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        title: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            "List Produk",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 28),
            child: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                  icon: Icon(Icons.menu, color: Colors.white,),
                );
              },
            ),
          )
        ],
      ),
      body: (userproduct.length == 0)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('assets/images/kosong.png'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 28, bottom: 4),
                    child: Text(
                      "Yah Produk Masih Kosong",
                      style: Theme.of(context).textTheme.bodyText1?.merge(
                            TextStyle(fontWeight: FontWeight.bold),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Tambah produk yuk supaya bisa menambah penghasilan.",
                      style: Theme.of(context).textTheme.bodyText2?.merge(
                            TextStyle(color: Colors.grey),
                          ),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          : Consumer<Products>(
              builder: (context, value, child) {
                return ItemProduk(userproduct: userproduct);
              },
            ),
    );
  }
}
