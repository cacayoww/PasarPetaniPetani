import 'package:flutter/material.dart';

class Status with ChangeNotifier {
  String? idPermintaan;
  String? nama;
  String? keterangan;
  DateTime? tglPerubahan;

  Status({
    @required this.idPermintaan,
    @required this.nama,
    @required this.keterangan,
    @required this.tglPerubahan
  });
}
