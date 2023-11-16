// ignore_for_file: prefer_const_constructors, unnecessary_import, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../providers/user.dart';
import '../providers/users.dart';
import '../widgets/validvalue.dart';

class EditProfile extends StatefulWidget {
  static const routeName = '/editprofile';

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  bool ubah = false;
  bool readOnlyNama = true;
  bool errorNama = false;
  bool readOnlyAlamat = true;
  bool readOnlyNoTelp = true;
  bool errorpwdlama = false;
  bool errorpwdbaru = false;
  bool errorpwdconfirm = false;
  String nama = "123";
  String alamat = "123";
  String notelp = "123";
  String pwdLama = "";
  String pwdBaru = "";
  String pwdBaruConfirm = "";

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as User;
    final usr = Provider.of<Users>(context).findByEmail(user.email);

    return Scaffold(
      backgroundColor: Color(0xffF4FBF4),
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white), onPressed: () {
                            Navigator.of(context).pop();
                          },),
        toolbarHeight: MediaQuery.of(context).size.height * 0.10,
        title: Text(
          "Edit Profil",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: 20,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 40, backgroundImage: AssetImage(usr.profil!)),
            ],
          ),
          SizedBox(height: 32),
          TextFormField(
            autofocus: false,
            readOnly: readOnlyNama,
            initialValue: usr.nama!,
            decoration: InputDecoration(
              labelText: 'Nama Pengguna',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    readOnlyNama = false;
                  });
                },
                icon: Icon(
                  Icons.edit,
                  size: 20,
                ),
              ),
            ),
            onChanged: (value) {
              setState(() {
                nama = value;
              });
            },
            onFieldSubmitted: (value) {
              setState(() {
                readOnlyNama = true;
                // if (value.isEmpty) {
                //   errorNama = true;
                // } else {
                //   errorNama = false;
                // }
              });
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            autofocus: false,
            initialValue: usr.email!,
            readOnly: true,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          SizedBox(height: 8),
          TextFormField(
            autofocus: false,
            readOnly: readOnlyAlamat,
            initialValue: usr.alamat!,
            decoration: InputDecoration(
              labelText: 'Alamat',
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    readOnlyAlamat = false;
                  });
                },
                icon: Icon(
                  Icons.edit,
                  size: 20,
                ),
              ),
            ),
            onChanged: (value) {
              setState(
                () {
                  alamat = value;
                },
              );
            },
            onFieldSubmitted: (value) {
              setState(() {
                readOnlyAlamat = true;
              });
            },
          ),
          SizedBox(height: 8),
          TextFormField(
            autofocus: false,
            readOnly: readOnlyNoTelp,
            initialValue:
                (usr.noTelp! == '') ? "(belum terdaftar)" : usr.noTelp!,
            decoration: InputDecoration(
                labelText: 'Nomor Telepon',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      readOnlyNoTelp = false;
                    });
                  },
                  icon: Icon(
                    Icons.edit,
                    size: 20,
                  ),
                )),
            onChanged: (value) {
              setState(() {
                notelp = value;
              });
            },
            onFieldSubmitted: (value) {
              setState(() {
                readOnlyNoTelp = true;
              });
            },
          ),
          SizedBox(height: 8),
          Column(
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    ubah = true;
                  });
                },
                child: Text("Ubah Password?"),
              ),
            ],
          ),
          SizedBox(height: 8),
          (ubah)
              ? Column(
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Masukkan Password Lama...",
                        labelText: "Password Lama",
                        // errorText: (errorpwdlama) ? "Password salah" : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          pwdLama = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Masukkan Password Baru...",
                        labelText: "Password Baru",
                        // errorText: (errorpwdbaru)
                        //     ? "Password tidak boleh kosong"
                        //     : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          pwdBaru = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    TextField(
                      decoration: InputDecoration(
                        hintText: "Konfirmasi Password Baru...",
                        labelText: "Konfirmasi Password Baru",
                        // errorText:
                        //     (errorpwdconfirm) ? "Password baru salah" : null,
                      ),
                      onChanged: (value) {
                        setState(() {
                          pwdBaruConfirm = value;
                        });
                      },
                    ),
                    SizedBox(height: 8),
                    Column(
                      children: [
                        TextButton(
                          onPressed: () {
                            setState(() {
                              ubah = false;
                            });
                          },
                          child: Text("Batal Ubah Password"),
                        ),
                      ],
                    ),
                  ],
                )
              : Container(),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  validValue(context, usr, nama, alamat, notelp, ubah, pwdLama, pwdBaru, pwdBaruConfirm);

                },
                child: Text("Simpan",style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
