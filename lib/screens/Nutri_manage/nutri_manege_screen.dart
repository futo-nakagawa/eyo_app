import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:eyo_app/main.dart';
import 'package:eyo_app/screens/ocr_screen/ocr_screen.dart';
import 'package:eyo_app/screens/Nutri_manage/Nutridata.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class NutriMangeScreen extends StatefulWidget {
  const NutriMangeScreen({Key? key}) : super(key: key);

  @override
  State<NutriMangeScreen> createState() => _NutriMangeScreenState();
}

class _NutriMangeScreenState extends State<NutriMangeScreen> {
  // 仮のデータベースからのデータ
  int meterData = 20;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DATE'),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xffF18A69),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // ハンバーガーメニューが押されたときの処理
            },
          ),
        ],
        toolbarHeight: 70, // 任意の高さを指定
      ),
      backgroundColor: Color(0xffFFECE1),
      body: MyBody(meterValue: meterData),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFF9E8A4),
        onPressed: () {
          // ボタンが押されたときの処理
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => OcrScreen()),
          );
        },
        child: Icon(Icons.arrow_forward),
      ),
    );
  }
}

class MyBody extends StatelessWidget {
  final int meterValue;

  const MyBody({Key? key, required this.meterValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        if (index == 0) {
          // 1番目のアイテム: 横向きのメータ
          return HorizontalMeter(meterValue: meterValue);
        } else if (index == 1) {
          // 2番目のアイテム: テキストと2つのボックス
          return TextAndBoxes();
        } else {
          // 3番目以降のアイテム: 非表示のコンテナ
          return Container();
        }
      },
    );
  }
}

class HorizontalMeter extends StatefulWidget {
  final int meterValue;

  const HorizontalMeter({Key? key, required this.meterValue}) : super(key: key);

  @override
  _HorizontalMeterState createState() => _HorizontalMeterState();
}

class _HorizontalMeterState extends State<HorizontalMeter>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(
      begin: 0.0,
      end: widget.meterValue / 100, // 0から1の範囲に正規化
    ).animate(_controller);

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 384,
        //width: 320,
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 上部に寄せる
          crossAxisAlignment: CrossAxisAlignment.start, // 左寄せにする
          children: [
            Stack(
              children: [
                Text(
                  '栄養サマリー',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 20,
                    fontFamily: 'Zen-B',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 4
                      ..color = Color(0xFF323942),
                  ),
                ),
                Text(
                  '栄養サマリー',
                  style: TextStyle(
                    height: 1.2,
                    fontFamily: 'Zen-B',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            Expanded(
              child: NutriDate(),
            )
          ],
        ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class TextAndBoxes extends StatelessWidget {
  const TextAndBoxes({Key? key}) : super(key: key);

  void _showModal(BuildContext context, String title) {
    showModalBottomSheet(
        //モーダルの背景の色、透過
        backgroundColor: Colors.transparent,
        //ドラッグ可能にする（高さもハーフサイズからフルサイズになる様子）
        isScrollControlled: true,
        context: context,
        builder: (BuildContext context) {
          return Container(
            margin: EdgeInsets.only(top: 64),
            decoration: BoxDecoration(
              //モーダル自体の色
              color: Colors.white,
              //角丸にする
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            '不足した栄養',
            style: TextStyle(
              height: 1.2,
              fontSize: 20,
              fontFamily: 'Zen-B',
              foreground: Paint()
                ..style = PaintingStyle.stroke
                ..strokeWidth = 4
                ..color = Color(0xFF323942),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Text(
            '不足した栄養',
            style: TextStyle(
              height: 1.2,
              fontFamily: 'Zen-B',
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
        Container(
          height: 360,
          width: double.infinity,
          margin: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black, width: 1.5),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 28,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      child: Container(
                        width: 240,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFECE1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: Center(
                          child: Text(
                            'たんぱく質',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        print('ボタン1がおされたよ');
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 240,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFECE1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: Center(
                          child: Text(
                            '脂質',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        Container(
                          height: 400,
                          width: 300,
                        );
                        print('ボタン2がおされたよ');
                      },
                    ),
                    SizedBox(
                      height: 32,
                    ),
                    GestureDetector(
                      child: Container(
                        width: 240,
                        height: 80,
                        decoration: BoxDecoration(
                          color: Color(0xffFFECE1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.black, width: 1.5),
                        ),
                        child: Center(
                          child: Text(
                            '炭水化物',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        print('ボタン3がおされたよ');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
