// ignore_for_file: prefer_const_constructors

import 'package:apk_sederhana/widgets/formatidr.dart';

import './tarikpendapatan.dart';
import 'package:flutter/material.dart';

import '../providers/user.dart';

class BoxPendapatan extends StatelessWidget {
  const BoxPendapatan({
    Key? key,
    required this.usr,
  }) : super(key: key);

  final User usr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 164),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: MediaQuery.of(context).size.height * 0.2,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                // boxShadow: [BoxShadow(color: Colors.grey, spreadRadius: 1, blurRadius: 5, offset: Offset(1, 1))]
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 28),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Pendapatan",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      ?.merge(TextStyle(
                                          fontWeight: FontWeight.bold))),
                              SizedBox(height: 4),
                              Text(FormatCurrency.convertToIdr(usr.pendapatan?.toInt(), 0),
                                  style: Theme.of(context).textTheme.bodyText1),
                            ],
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Lihat Riwayat",
                              style: TextStyle(color: Colors.green),
                            ),
                          )
                        ],
                      ),
                    ),
                    TarikPendapatan()
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
