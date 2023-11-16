// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './main_screen.dart';
import '../providers/users.dart';

class LoginPage extends StatefulWidget {
  static const routeName = '/loginpage';

  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email = '';
  String _pwd = '';
  bool isVisible = false;
  bool isValidPwd = true;
  bool isValidEmail = true;

  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Users>(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Image(
          image: AssetImage('assets/images/sayur.png'),
          fit: BoxFit.cover,
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(height: 100),
                const Image(image: AssetImage('assets/images/logo.png')),
                const SizedBox(height: 48),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 20),
                    Text(
                      'Email',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.green)),
                      errorText:
                          (!isValidEmail) ? 'Email tidak terdaftar' : null,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _email = value;
                      });
                    },
                  ),
                ),
                const SizedBox(height: 28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(width: 20),
                    Text(
                      'Password',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        _pwd = value;
                      });
                    },
                    obscureText: !isVisible,
                    decoration: InputDecoration(
                      errorText: (!isValidPwd) ? 'Password salah' : null,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isVisible = !isVisible;
                          });
                        },
                        icon: (isVisible)
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 100),
                ElevatedButton(
                  onPressed: () {
                    String usr = userData.isPwdTrue(_email, _pwd);
                    if (usr == 'Valid') {
                      Navigator.of(context).pushReplacementNamed(
                          MainScreen.routeName,
                          arguments: _email);
                    } else if (usr == 'Email Not Valid') {
                      setState(() {
                        isValidEmail = false;
                        isValidPwd = true;
                      });
                    } else {
                      setState(() {
                        isValidPwd = false;
                        isValidEmail = true;
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Color(0xff17C118),
                    // backgroundColor: Colors.green,
                    fixedSize: Size(MediaQuery.of(context).size.width - 40, 44),
                  ),
                  child: const Text("Masuk",
                      style: TextStyle(color: Colors.white)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum memiliki akun?"),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(fixedSize: Size.fromWidth(0)),
                      child: Text(
                        "Daftar",
                        style: TextStyle(
                          color: Color(0xff17C118),
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
