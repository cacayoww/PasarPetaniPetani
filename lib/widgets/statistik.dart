
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import '../providers/user.dart';

class Statistik extends StatelessWidget {
  const Statistik({
    Key? key,
    required this.usr,
  }) : super(key: key);

  final User usr;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 16),
      child: Column(
        children: [
          Row(
            children: [
              
              Text(
                "Statistik",
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    ?.merge(TextStyle(fontWeight: FontWeight.bold)),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          SizedBox(height: 14),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 164,
                height: 96,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Consumer<Products>(
                  builder: (context, value, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${value.getDiterima(usr.email).toString()}",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.merge(
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Produk Diterima",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.merge(TextStyle(color: Color(0xffAAAAAA))),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Container(
                width: 164,
                height: 96,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(8))),
                child: Consumer<Products>(
                  builder: (context, value, child) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "${value.getDiproses(usr.email).toString()}",
                          style: Theme.of(context)
                              .textTheme
                              .headline3
                              ?.merge(
                                  TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          "Produk Diproses",
                          style: Theme.of(context)
                              .textTheme
                              .bodyText1
                              ?.merge(TextStyle(color: Color(0xffAAAAAA))),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
