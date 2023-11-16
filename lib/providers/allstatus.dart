import 'package:apk_sederhana/providers/status.dart';
import 'package:flutter/material.dart';

class AllStatus with ChangeNotifier {
  final List<Status> _allstatus = [];

  List<Status> get allstatus {
    return [..._allstatus];
  }

  int getLength(){
    return _allstatus.length;
  }

  void addStatus(String idPermintaan, String nama, String keterangan) {
    _allstatus.add(
      Status(
        idPermintaan: idPermintaan,
        nama: nama,
        keterangan: keterangan,
        tglPerubahan: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  List<Status> getStatusByIdPermintaan(idPermintaan) {
    return _allstatus.where((element) => element.idPermintaan == idPermintaan).toList();
  }

}
