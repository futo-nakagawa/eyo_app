import 'package:eyo_app/screens/Nutri_manage/nutri_manege_screen.dart';
import 'package:flutter/material.dart';
//import 'package:eyo_app/main.dart';
import 'package:flutter_svg/svg.dart';
import 'package:eyo_app/account_create/account_create.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool loginFlag = false;
  bool registrationFlag = false;
  bool nameFlag = false;
  bool passFlag = false;
  String mail = '';
  String pass = '';

  Future<void> _login() async {
    final url = Uri.parse('http://localhost:8000/eyo_app/users');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': mail,
          'password': pass, // パスワードをハッシュ化して送信
        }),
      );
      if (response.statusCode == 200) {
        // ログインが成功した場合の処理
        //loginFlag = true;
        print('ログイン成功');
      } else {
        // ログインが失敗した場合の処理
        print('ログイン失敗');
      }
    } catch (error) {
      // エラーが発生した場合の処理
      print('エラー: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFFFECE1)),
          child: Stack(
            children: [
              Center(
                child: Column(
                  children: [
                    if (!loginFlag && !registrationFlag)
                      Visibility(
                        visible: !registrationFlag,
                        child: Padding(
                            padding: EdgeInsets.only(top: 245),
                            child: Image.asset('assets/image/logo.png')),
                      ),
                    if (registrationFlag) // If loginFlag is true, show the text fields
                      Padding(
                        padding: const EdgeInsets.only(top: 245),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'ログイン',
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Zen-Bl',
                                //color: kFontColor
                              ),
                            ),
                            SizedBox(height: 41),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'メールアドレス',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Zen-B',
                                    //color: kFontColor
                                  ),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  width: 310,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0.1,
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          offset: Offset(0, 1.5),
                                        )
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        onTap: () {},
                                        //controller:
                                        onChanged: (value) {
                                          setState(() {
                                            mail = value;
                                          });
                                        },
                                        style: TextStyle(
                                          color: Color(0xFF511C0B),
                                          fontSize: 15,
                                          fontFamily: 'Zen-B',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          height: 1.25,
                                          letterSpacing: -0.5,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          //hintText: 'お名前',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'パスワード',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Zen-B',
                                  ),
                                ),
                                SizedBox(height: 6),
                                Container(
                                  width: 310,
                                  height: 50,
                                  decoration: const BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 0.1,
                                          color: Colors.black12,
                                          spreadRadius: 1,
                                          offset: Offset(0, 1.5),
                                        )
                                      ],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10),
                                      )),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 16),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: TextField(
                                        //伏字
                                        obscureText: true,
                                        onTap: () {},
                                        //controller:
                                        onChanged: (value) {
                                          setState(() {
                                            pass = value;
                                          });
                                        },
                                        style: TextStyle(
                                          color: Color(0xFF511C0B),
                                          fontSize: 15,
                                          fontFamily: 'Zen-B',
                                          fontStyle: FontStyle.normal,
                                          fontWeight: FontWeight.w500,
                                          height: 1.25,
                                          letterSpacing: -0.5,
                                        ),
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          //hintText: 'お名前',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print(mail);
                        print(pass);
                        // Open the textfield when the login button is pressed
                        //_showLoginFields();
                        if (registrationFlag) {
                        } else
                          setState(() {
                            // loginFlag = true;
                            registrationFlag = true;
                          });
                        if (loginFlag) ;
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NutriMangeScreen()),
                        );
                      },
                      child: Container(
                        width: 220,
                        height: 60,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/image/login_button.png',
                            ),
                          ),
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Text(
                              'ログイン',
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 24,
                                fontFamily: 'Zen-B',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 4
                                  ..color = Color(0xFF323942),
                              ),
                            ),
                            Text(
                              'ログイン',
                              style: TextStyle(
                                height: 1.2,
                                fontFamily: 'Zen-B',
                                fontSize: 24,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      child: const Text(
                        'アカウント登録はこちら',
                        style: TextStyle(
                          fontFamily: 'Zen-M',
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        print('アカウント登録ボタンを押した');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AccountCreateScreen()),
                        );
                      },
                    ),
                    const SizedBox(height: 160)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
