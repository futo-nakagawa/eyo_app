import 'package:flutter/material.dart';
import 'package:eyo_app/main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Color(0xFFEDF1F0)),
        child: Stack(
          children: [
            Center(
              child: Container(
                width: 183,
                height: 183,
                decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
              ),
            ),
            const Center(
              child: Text(
                'ロゴ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => MyApp()));
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
                              fontSize: 20,
                              fontFamily: 'Zen-B',
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 30
                                ..color = Color(0xFF323942),
                            ),
                          ),
                          Text(
                            'ログイン',
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
                  const SizedBox(height: 20),
                  const Text(
                    'アカウント登録はこちら',
                    style: TextStyle(
                      fontFamily: 'Zen-M',
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 60)
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
