import 'package:flutter/material.dart';

void validValue(context, usr, nama, alamat, notelp, ubah, pwdLama, pwdBaru,
    pwdBaruConfirm) {
  if (nama != "") {
    if (nama == "123") {
      if (alamat == "123") {
        if (notelp == "123") {
          if (ubah) {
            if (usr.isPwdTrue(pwdLama)) {
              if (pwdBaru != "") {
                if (pwdBaru == pwdBaruConfirm) {
                  usr.editProfil(usr.nama!, usr.alamat!, pwdBaru, usr.noTelp!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil. Perubahan telah tersimpan."),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal. Konfirmasi Password Baru Salah"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal. Password Baru Tidak Boleh Kosong"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal. Password Lama Salah"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            }
          } else {
            usr.editProfil(usr.nama!, usr.alamat!, "", usr.noTelp!);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil. Perubahan telah tersimpan."),
                duration: Duration(milliseconds: 1000),
              ),
            );
          }
        } else {
          if (ubah) {
            if (usr.isPwdTrue(pwdLama)) {
              if (pwdBaru != "") {
                if (pwdBaru == pwdBaruConfirm) {
                  usr.editProfil(usr.nama!, usr.alamat!, pwdBaru, notelp);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil. Perubahan telah tersimpan."),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal. Konfirmasi Password Baru Salah"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal. Password Baru Tidak Boleh Kosong"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal. Password Lama Salah"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            }
          } else {
            usr.editProfil(usr.nama!, usr.alamat!, "", notelp);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil. Perubahan telah tersimpan."),
                duration: Duration(milliseconds: 1000),
              ),
            );
          }
        }
      } else {
        if (notelp == "123") {
          if (ubah) {
            if (usr.isPwdTrue(pwdLama)) {
              if (pwdBaru != "") {
                if (pwdBaru == pwdBaruConfirm) {
                  usr.editProfil(usr.nama!, alamat, pwdBaru, usr.noTelp!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil. Perubahan telah tersimpan."),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal. Konfirmasi Password Baru Salah"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal. Password Baru Tidak Boleh Kosong"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal. Password Lama Salah"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            }
          } else {
            usr.editProfil(usr.nama!, alamat, "", usr.noTelp!);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil. Perubahan telah tersimpan."),
                duration: Duration(milliseconds: 1000),
              ),
            );
          }
        } else {
          if (ubah) {
            if (usr.isPwdTrue(pwdLama)) {
              if (pwdBaru != "") {
                if (pwdBaru == pwdBaruConfirm) {
                  usr.editProfil(usr.nama!, alamat, pwdBaru, notelp);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil. Perubahan telah tersimpan."),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal. Konfirmasi Password Baru Salah"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal. Password Baru Tidak Boleh Kosong"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal. Password Lama Salah"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            }
          } else {
            usr.editProfil(usr.nama!, alamat, "", notelp);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil. Perubahan telah tersimpan."),
                duration: Duration(milliseconds: 1000),
              ),
            );
          }
        }
      }
    } else {
      if (alamat == "123") {
        if (notelp == "123") {
          if (ubah) {
            if (usr.isPwdTrue(pwdLama)) {
              if (pwdBaru != "") {
                if (pwdBaru == pwdBaruConfirm) {
                  usr.editProfil(nama, usr.alamat!, pwdBaru, usr.noTelp!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil. Perubahan telah tersimpan."),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal. Konfirmasi Password Baru Salah"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal. Password Baru Tidak Boleh Kosong"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal. Password Lama Salah"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            }
          } else {
            usr.editProfil(nama, usr.alamat!, "", usr.noTelp!);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil. Perubahan telah tersimpan."),
                duration: Duration(milliseconds: 1000),
              ),
            );
          }
        } else {
          if (ubah) {
            if (usr.isPwdTrue(pwdLama)) {
              if (pwdBaru != "") {
                if (pwdBaru == pwdBaruConfirm) {
                  usr.editProfil(nama, usr.alamat!, pwdBaru, notelp);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil. Perubahan telah tersimpan."),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal. Konfirmasi Password Baru Salah"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal. Password Baru Tidak Boleh Kosong"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal. Password Lama Salah"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            }
          } else {
            usr.editProfil(nama, usr.alamat!, "", notelp);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil. Perubahan telah tersimpan."),
                duration: Duration(milliseconds: 1000),
              ),
            );
          }
        }
      } else {
        if (notelp == "123") {
          if (ubah) {
            if (usr.isPwdTrue(pwdLama)) {
              if (pwdBaru != "") {
                if (pwdBaru == pwdBaruConfirm) {
                  usr.editProfil(nama, alamat, pwdBaru, usr.noTelp!);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil. Perubahan telah tersimpan."),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal. Konfirmasi Password Baru Salah"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal. Password Baru Tidak Boleh Kosong"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal. Password Lama Salah"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            }
          } else {
            usr.editProfil(nama, alamat, "", usr.noTelp!);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil. Perubahan telah tersimpan."),
                duration: Duration(milliseconds: 1000),
              ),
            );
          }
        } else {
          if (ubah) {
            if (usr.isPwdTrue(pwdLama)) {
              if (pwdBaru != "") {
                if (pwdBaru == pwdBaruConfirm) {
                  usr.editProfil(nama, alamat, pwdBaru, notelp);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Berhasil. Perubahan telah tersimpan."),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Gagal. Konfirmasi Password Baru Salah"),
                      duration: Duration(milliseconds: 1000),
                    ),
                  );
                }
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Gagal. Password Baru Tidak Boleh Kosong"),
                    duration: Duration(milliseconds: 1000),
                  ),
                );
              }
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Gagal. Password Lama Salah"),
                  duration: Duration(milliseconds: 1000),
                ),
              );
            }
          } else {
            usr.editProfil(nama, alamat, "", notelp);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text("Berhasil. Perubahan telah tersimpan."),
                duration: Duration(milliseconds: 1000),
              ),
            );
          }
        }
      }
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Gagal. Nama Tidak Boleh Kosong"),
        duration: Duration(milliseconds: 1000),
      ),
    );
  }
}
