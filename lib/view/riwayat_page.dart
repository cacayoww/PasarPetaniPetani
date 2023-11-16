// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_is_empty, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/allriwayat.dart';
import '../providers/products.dart';
import '../providers/user.dart';

class RiwayatPage extends StatelessWidget {
  static const routeName = '/riwayatpage';
  @override
  Widget build(BuildContext context) {
    final usr = Provider.of<User>(context, listen: false);
    final riwayat = Provider.of<AllRiwayat>(context).riwayatByUserId(usr.email);
    final products = Provider.of<Products>(context);

    return Scaffold(
      backgroundColor: Color(0xffF4FBF4),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        title: Text(
          "Riwayat Permintaan",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: (riwayat.length == 0)
          ? Padding(
              padding: const EdgeInsets.only(right: 20, left: 20, bottom: 20),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/riwayat.png')),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 4),
                    child: Text(
                      "Yah Riwayat Masih Kosong",
                      style: Theme.of(context).textTheme.bodyText1?.merge(
                            TextStyle(fontWeight: FontWeight.bold),
                          ),
                    ),
                  ),
                  Text(
                    "Anda belum melakukan penambahan permintaan",
                    style: Theme.of(context).textTheme.bodyText2?.merge(
                          TextStyle(color: Colors.grey),
                        ),
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
            )
          : ListView.builder(
            padding: const EdgeInsets.all(20),
            itemCount: riwayat.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  elevation: 3,
                  shadowColor: Colors.grey,
                  child: ListTile(
                    leading: Image(
                      image: AssetImage(products
                          .getProductById(
                              riwayat[riwayat.length - 1 - index].idProduk)
                          .imageUrl!),
                      height: 50,
                      width: 50,
                    ),
                    minLeadingWidth: 10,
                    title: Text(
                        "Produk ${products.getProductById(riwayat[riwayat.length - 1 - index].idProduk).namaProduk}"),
                    subtitle: Text(
                      riwayat[riwayat.length - 1 - index].nama!,
                      style: TextStyle(fontSize: 12),
                    ),
                    trailing: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            DateFormat.MMMd().format(
                                riwayat[riwayat.length - 1 - index].waktu!),
                            style: TextStyle(fontSize: 12),
                          ),
                          Text(
                            DateFormat.Hm().format(
                                riwayat[riwayat.length - 1 - index].waktu!),
                            style: TextStyle(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
    );
  }
}
