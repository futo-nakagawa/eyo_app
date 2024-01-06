import 'package:eyo_app/screens/Nutri_manage/nutri_manege_screen.dart';
import 'package:flutter/material.dart';
import 'package:eyo_app/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String userName = "";
  String password = "";
  bool userFlag = false;
  bool nameFlag = false;
  bool logFlag = false;

  void onLoginButtonPressed() {
    if (userName.isNotEmpty && password.isNotEmpty) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NutriMangeScreen(), // 遷移先のページ
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(
            color: Color(0xFFFFECE1),
          ),
          child: Stack(
            children: [
              Center(
                child: Container(
                  width: 188,
                  height: 188,
                  decoration: BoxDecoration(
                    color: logFlag ? Colors.transparent : Color(0xFFE9E9E9),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              logFlag
                  ? Padding(
                      padding: const EdgeInsets.all(64.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            '名前',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Zen-B',
                              color: Color(0xff323942),
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
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  onChanged: (value) {
                                    setState(() {
                                      userName = value;
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 80),
                          const Text(
                            'パスワード',
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Zen-B',
                              color: Color(0xff323942),
                            ),
                          ),
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
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: 16),
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: TextField(
                                  obscureText: true,
                                  onChanged: (value) {
                                    setState(() {
                                      password = value;
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
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          logFlag = true;
                        });
                        onLoginButtonPressed(); // ログインボタンが押されたらの処理
                      },
                      child: Container(
                        width: 240,
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
                              logFlag ? '始める' : 'ログイン',
                              style: TextStyle(
                                height: 1.2,
                                fontSize: 20,
                                fontFamily: 'Zen-B',
                                foreground: Paint()
                                  ..style = PaintingStyle.stroke
                                  ..strokeWidth = 3
                                  ..color = Color(0xFF323942),
                              ),
                            ),
                            Text(
                              logFlag ? '始める' : 'ログイン',
                              style: TextStyle(
                                height: 1.2,
                                fontFamily: 'Zen-B',
                                fontSize: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'アカウント登録はこちら',
                      style: TextStyle(
                        fontFamily: 'Zen-M',
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 50),
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
