// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import './editprofile_page.dart';
import './login_page.dart';
import '../providers/user.dart';

class ProfilePage extends StatelessWidget {
  static const routeName = '/profilepage';

  String obsPwd(String pwd) {
    List<String> obs = List.generate(pwd.length, (index) => '*');
    return obs.join();
  }

  @override
  Widget build(BuildContext context) {
    final usr = Provider.of<User>(context, listen: true);
    return Scaffold(
      backgroundColor: Color(0xffF4FBF4),
      appBar: AppBar(
        toolbarHeight: MediaQuery.of(context).size.height * 0.18,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage(usr.profil!),
              ),
            ],
          ),
        ),
        leadingWidth: 100,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              usr.nama!,
              style: Theme.of(context).textTheme.bodyText1?.merge(
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            ),
            SizedBox(height: 4),
            Text(
              usr.email!,
              style: TextStyle(fontSize: 12, color: Colors.white),
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(EditProfile.routeName, arguments: usr);
              },
              icon: SvgPicture.asset("assets/icons/Edit.svg"),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 36),
        child: Column(
          children: [
            Row(
              children: const [
                Text("Nama Pengguna", style: TextStyle(color: Colors.grey))
              ],
            ),
            SizedBox(height: 8),
            Row(
              children: [Text(usr.nama!)],
            ),
            SizedBox(height: 16),
            Row(children: const [
              Text("Email", style: TextStyle(color: Colors.grey))
            ]),
            SizedBox(height: 8),
            Row(
              children: [Text(usr.email!)],
            ),
            SizedBox(height: 16),
            Row(children: const [
              Text("Password", style: TextStyle(color: Colors.grey))
            ]),
            SizedBox(height: 8),
            Row(
              children: [Text(obsPwd(usr.password!))],
            ),
            SizedBox(height: 16),
            Divider(thickness: 2),
            SizedBox(height: 16),
            Row(children: const [
              Text("Alamat", style: TextStyle(color: Colors.grey))
            ]),
            SizedBox(height: 8),
            Row(
              children: [Text(usr.alamat!)],
            ),
            SizedBox(
              height: 16,
            ),
            Row(children: const [
              Text("Nomor Telepon", style: TextStyle(color: Colors.grey))
            ]),
            SizedBox(height: 8),
            Row(
              children: [
                (usr.noTelp == '')
                    ? Text("(belum terdaftar)")
                    : Text(usr.noTelp!)
              ],
            ),
            SizedBox(height: 16),
            Divider(thickness: 2),
            SizedBox(height: 28),
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      title: Text("Logout"),
                      content: Text("Apakah Anda yakin akan logout ?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("Tidak"),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                LoginPage.routeName, (route) => false);
                          },
                          child: Text("Ya"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: SizedBox(
                width: 150,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [Icon(Icons.logout), Text("Logout Akun")],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
