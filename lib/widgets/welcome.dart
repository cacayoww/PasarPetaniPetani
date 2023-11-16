import 'package:flutter/material.dart';

import '../providers/user.dart';

class Welcome extends StatelessWidget {
  const Welcome({
    Key? key,
    required this.usr,
  }) : super(key: key);

  final User usr;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 180,
          color: Colors.green,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 78),
                    Text(
                      "Selamat Datang",
                      style: Theme.of(context)
                          .textTheme
                          .headline5
                          ?.apply(color: Colors.white),
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                    ),
                    SizedBox(height: 8),
                    Text(
                      usr.nama!,
                      style: Theme.of(context).textTheme.headline4?.merge(
                            TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                      textAlign: TextAlign.start,
                      textDirection: TextDirection.ltr,
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(height: 68),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage(usr.profil!),
                    )
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
