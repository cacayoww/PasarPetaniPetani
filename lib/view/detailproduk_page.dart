// ignore_for_file: no_leading_underscores_for_local_identifiers, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../widgets/formatidr.dart';
import '../providers/status.dart';
import '../providers/allstatus.dart';

class DetailProduk extends StatefulWidget {
  static const routeName = '/detailproduk';

  const DetailProduk({super.key});

  @override
  State<DetailProduk> createState() => _DetailProdukState();
}

class _DetailProdukState extends State<DetailProduk>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    Product item = ModalRoute.of(context)?.settings.arguments as Product;
    List<Status> st =
        Provider.of<AllStatus>(context).getStatusByIdPermintaan(item.idProduk);
    TabController _tabController = TabController(length: 2, vsync: this);
    return Scaffold(
      backgroundColor: const Color(0xffF4FBF4),
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.arrow_back,color: Colors.white), onPressed: () {
                            Navigator.of(context).pop();
                          },),
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        title: const Text("Detail Produk",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            color: Colors.white,
            child: Image(
              image: AssetImage(item.imageUrl!),
              alignment: Alignment.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 20, right: 20, bottom: 24),
            child: Column(
              children: [
                Row(
                  children: [
                    Text(item.namaProduk!,
                        style: Theme.of(context)
                            .textTheme
                            .headline3
                            ?.merge(const TextStyle(fontWeight: FontWeight.bold))),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      FormatCurrency.convertToIdr(item.harga!.toInt(), 0),
                      style: const TextStyle(color: Colors.green),
                    )
                  ],
                )
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            tabs: [const Text("Detail"), const Text("Status")],
            labelColor: Colors.green,
            unselectedLabelColor: Colors.grey,
          ),
          SizedBox(
            width: double.infinity,
            height: 362,
            child: TabBarView(
              controller: _tabController,
              children: [
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 16,
                      left: 20,
                      right: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Kategori",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(item.kategori!),
                        const SizedBox(height: 8),
                        const Text(
                          "Jumlah",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(item.jumlah.toString()),
                        const SizedBox(height: 8),
                        const Text(
                          "Durasi Tahan",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text(item.durasiTahan!),
                        const SizedBox(height: 8),
                        const Text(
                          "Berat",
                          style: TextStyle(
                              color: Colors.green, fontWeight: FontWeight.bold),
                        ),
                        Text("${item.berat!.toInt().toString()} gram"),
                      ],
                    ),
                  ),
                ),
                ListView.builder(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 20,
                    right: 20,
                  ),
                  itemCount: st.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      
                      leading: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: 12,
                            backgroundColor: Colors.grey,
                            child: CircleAvatar(
                              radius: 10,
                              backgroundColor: Color(0xffF4FBF4),
                            ),
                          ),
                        ],
                      ),
                      minLeadingWidth: 20,
                      title: Text(DateFormat.MMMMd().format(st[index].tglPerubahan!), style: const TextStyle(fontSize: 12),),
                      trailing: Text(DateFormat.Hm().format(st[index].tglPerubahan!), style: const TextStyle(fontSize: 12)),
                      subtitle: Text(st[index].nama!, style: const TextStyle(fontSize: 12),),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
