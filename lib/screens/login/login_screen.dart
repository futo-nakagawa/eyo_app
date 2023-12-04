import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('JboyApp'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
          child: Container(
        width: 390,
        height: 844,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(color: Color(0xFFEDF1F0)),
        child: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                width: 390,
                height: 44,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(),
                child: Stack(
                  children: [
                    Positioned(
                      left: 308.67,
                      top: 17.33,
                      child: Container(
                        width: 66.66,
                        height: 11.34,
                        child: Stack(
                          children: [
                            Positioned(
                              left: 42.33,
                              top: 0,
                              child: Container(
                                width: 24.33,
                                height: 11.33,
                                child: Stack(children: []),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24,
                      top: 12,
                      child: Container(
                        width: 54,
                        height: 21,
                        padding: const EdgeInsets.only(top: 1),
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 54,
                              height: 20,
                              child: Text(
                                '9:41',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w600,
                                  height: 0.09,
                                  letterSpacing: -0.50,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 0,
              top: 810,
              child: Container(
                width: 390,
                height: 34,
                padding: const EdgeInsets.only(
                  top: 21,
                  left: 128,
                  right: 128,
                  bottom: 8,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 134,
                      height: 5,
                      decoration: ShapeDecoration(
                        color: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 102,
              top: 155,
              child: Container(
                width: 183,
                height: 183,
                decoration: BoxDecoration(color: Color(0xFFD9D9D9)),
              ),
            ),
            Positioned(
              left: 180,
              top: 237,
              child: Text(
                'ロゴ',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.50,
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 510,
              child: Container(
                width: 347,
                height: 67,
                decoration: ShapeDecoration(
                  color: Color(0xFF78DCCF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 24,
              top: 626,
              child: Container(
                width: 347,
                height: 67,
                decoration: ShapeDecoration(
                  color: Color(0xFFD9D9D9),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 146,
              top: 534,
              child: Text(
                'アカウント登録',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.50,
                ),
              ),
            ),
            Positioned(
              left: 168,
              top: 650,
              child: Text(
                'ログイン',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.50,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
