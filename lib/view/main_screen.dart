import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import './addproduct_page.dart';
import '../providers/users.dart';
import './home_page.dart';
import './product_page.dart';
import './profile_page.dart';
import './riwayat_page.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/mainscreen';

  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _index = 0;

  List<Widget> allPages = [
    HomePage(),
    ProductPage(),
    RiwayatPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    final usrEmail = ModalRoute.of(context)?.settings.arguments as String;
    final usr = Provider.of<Users>(context).findByEmail(usrEmail);

    return Scaffold(
      body: ChangeNotifierProvider.value(
        value: usr,
        child: allPages[_index],
      ),
      floatingActionButton: (_index == 1)
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamed(AddProduct.routeName, arguments: usrEmail);
              },
              child: SvgPicture.asset("assets/icons/Add.svg")
            )
          : Container(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _index == 0
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.green,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset('assets/icons/Home.svg',
                        width: 24, height: 24),
                  )
                : SvgPicture.asset('assets/icons/Home.svg',
                    width: 24, height: 24),
            label: "Beranda",
          ),
          BottomNavigationBarItem(
            icon: _index == 1
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.green,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset('assets/icons/Produk.svg',
                        width: 24, height: 24),
                  )
                : SvgPicture.asset('assets/icons/Produk.svg',
                    width: 24, height: 24),
            label: "Produk",
          ),
          BottomNavigationBarItem(
            icon: _index == 2
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.green,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset('assets/icons/Riwayat.svg',
                        width: 24, height: 24),
                  )
                : SvgPicture.asset('assets/icons/Riwayat.svg',
                    width: 24, height: 24),
            label: "Riwayat",
          ),
          BottomNavigationBarItem(
            icon: _index == 3
                ? ColorFiltered(
                    colorFilter: const ColorFilter.mode(
                      Colors.green,
                      BlendMode.srcIn,
                    ),
                    child: SvgPicture.asset('assets/icons/Profile.svg',
                        width: 24, height: 24),
                  )
                : SvgPicture.asset('assets/icons/Profile.svg',
                    width: 24, height: 24),
            label: "Profil",
          ),
        ],
        currentIndex: _index,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        iconSize: 24,
        onTap: (value) {
          setState(() {
            _index = value;
          });
        },
      ),
    );
  }
}
