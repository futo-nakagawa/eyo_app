import 'package:eyo_app/screens/Login/login_screen.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:eyo_app/main.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bcrypt/flutter_bcrypt.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

class AccountCreateScreen extends StatefulWidget {
  const AccountCreateScreen({Key? key}) : super(key: key);
  @override
  State<AccountCreateScreen> createState() => _AccountCreateScreenState();
}

class _AccountCreateScreenState extends State<AccountCreateScreen> {
  final _emailTextController = TextEditingController();
  bool loginFlag = false;
  bool mailPassFlag = false;
  bool nameAgeFlag = false;
  bool nameFlag = false;
  bool passFlag = false;
  String mail = '';
  String pass = '';
  String name = '';
  int age = 0;
  int weight = 0;

  Future<void> _createAccount() async {
    final url = Uri.parse('http://localhost:8000/eyo_app/eyo_app_users_create');

    try {
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'name': name,
          'age': age,
          'weight': weight,
          'email': mail,
          //'password': _hashPassword(pass), // パスワードをハッシュ化して送信
        }),
      );

      if (response.statusCode == 201) {
        // アカウントが正常に作成された場合の処理
        print('アカウントが正常に作成されました。');
      } else {
        // エラーが発生した場合の処理
        print('アカウントの作成に失敗しました。');
      }
    } catch (error) {
      // エラーが発生した場合の処理
      print('エラー: $error');
    }
  }

//   Future<String> _hashPassword(String password) async {
//   // パスワードをハッシュ化
//   return FlutterBcrypt.hashPw(password, FlutterBcrypt.genSalt());
// }

  void _emailValidation() {
    final email = _emailTextController.text;
    // バリデーションチェック
    // 正規表現にemailがマッチしたらtrueを返す
    if (RegExp(
            r"/^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/)")
        .hasMatch(email)) {
      // メールの形式が正しい時の処理
    } else {
      // メールの形式が正しくない時の処理(エラーダイアログの表示など)
      print('メール形式で書いてください');
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
                    Padding(
                      padding: const EdgeInsets.only(top: 100),
                      child: Column(
                        //mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'アカウント作成',
                            style: TextStyle(
                              fontSize: 30,
                              fontFamily: 'Zen-Bl',
                            ),
                          ),
                          SizedBox(height: 40),
//----------------------------メール＆パスワード入力--------------------------------//
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'メールアドレス',
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
                                      onTap: () {},
                                      onChanged: (value) {
                                        setState(() {
                                          mail = value;
                                        });
                                        _emailTextController;
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

//----------------------------名前&年齢&体重入力--------------------------------//
                          SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'ニックネーム',
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
                                      onTap: () {},
                                      onChanged: (value) {
                                        setState(() {
                                          //email = value;
                                        });
                                      },
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[a-zA-Z0-9]')),
                                      ],
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
                                '年齢',
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
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                      ],
                                      //伏字
                                      //obscureText: true,
                                      onTap: () {},
                                      onChanged: (value) {},
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
                                '体重',
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
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        LengthLimitingTextInputFormatter(3),
                                        FilteringTextInputFormatter.allow(
                                            RegExp(r'[0-9]')),
                                      ],
                                      //伏字
                                      //obscureText: true,
                                      onTap: () {},
                                      onChanged: (value) {},
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
                      onTap: () {
                        if (mailPassFlag) {
                        } else
                          setState(() {
                            mailPassFlag = true;
                          });
                        print(mail);
                        print(pass);
                      },
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      child: const Text(
                        'ログインに戻る',
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
                              builder: (context) => LoginScreen()),
                        );
                        mailPassFlag = true;
                        nameAgeFlag = false;
                      },
                    ),
                    const SizedBox(height: 120)
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
