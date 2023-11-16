// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../providers/allriwayat.dart';
import '../providers/allstatus.dart';
import '../providers/products.dart';

class AddProduct extends StatefulWidget {
  static const routeName = '/addproduct';

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  String _nama = '';
  String _kategori = '';
  double _harga = 0;
  int _jumlah = 0;
  String _durasi = '';
  double _berat = 0;

  @override
  Widget build(BuildContext context) {
    final usrEmail = ModalRoute.of(context)?.settings.arguments as String;
    final allproducts = Provider.of<Products>(context);
    final status = Provider.of<AllStatus>(context);
    final riwayat = Provider.of<AllRiwayat>(context);
    return Scaffold(
      backgroundColor: Color(0xffF4FBF4),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white), onPressed: () {
                            Navigator.of(context).pop();
                          },),
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        title: Text(
          "Kirim Permintaan",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8),
                Text(
                  "Foto Produk",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 4),
                SizedBox(
                  width: 70,
                  height: 70,
                  child: Image(
                    image: AssetImage('assets/images/produkimage.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 12),
                Text(
                  "Nama Produk",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _nama = value;
                    });
                  },
                ),
                SizedBox(height: 12),
                Text(
                  "Kategori",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _kategori = value;
                    });
                  },
                ),
                SizedBox(height: 12),
                Text(
                  "Harga",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  
                  onChanged: (value) {
                    setState(() {
                      _harga = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 12),
                Text(
                  "Jumlah",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    setState(() {
                      _jumlah = int.parse(value);
                    });
                  },
                ),
                SizedBox(height: 12),
                Text(
                  "Durasi Tahan",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _durasi = value;
                    });
                  },
                ),
                SizedBox(height: 12),
                Text(
                  "Berat",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      ?.merge(TextStyle(fontWeight: FontWeight.bold)),
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[FilteringTextInputFormatter.digitsOnly],
                  onChanged: (value) {
                    setState(() {
                      _berat = double.parse(value);
                    });
                  },
                ),
                SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text("Konfirmasi Permintaan"),
                          content:
                              Text("Permintaan akan dikirim jika menekan 'Ya'"),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("Tidak"),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).popUntil((route) => route.isFirst);
                                allproducts.addProduct(usrEmail, _nama, _kategori, _harga, _jumlah, _durasi, _berat);
                                status.addStatus(allproducts.allproduct[allproducts.allproduct.length-1].idProduk!,"Permintaan Berhasil Dilakukan", "");
                                riwayat.addRiwayat(usrEmail, allproducts.allproduct[allproducts.allproduct.length-1].idProduk!, status.allstatus[status.allstatus.length-1].nama!, status.allstatus[status.allstatus.length-1].tglPerubahan!);
                              },
                              child: Text("Ya"),
                            )
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      fixedSize:
                          Size(MediaQuery.of(context).size.width - 40, 52)),
                  child: Text("Kirim", style: TextStyle(color: Colors.white),),
                ),
                SizedBox(height: 40),
              ],
            ),
          )
        ],
      ),
    );
  }
}
