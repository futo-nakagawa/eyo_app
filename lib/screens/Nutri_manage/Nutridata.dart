import 'package:flutter/material.dart';

class NutriDate extends StatefulWidget {
  @override
  _NutriDateState createState() => _NutriDateState();
}

class _NutriDateState extends State<NutriDate> with TickerProviderStateMixin {
  final Map<String, double> nutritionData = {
    'カロリー': 1000.0,
    'タンパク質': 20.0,
    '炭水化物': 120.0,
    '脂質': 10.0,
    '糖質': 5.0,
    '塩分': 1.0,
    '食物繊維': 5.0,
  };

  final Map<String, double> dailyIntake = {
    'カロリー': 2500.0,
    'タンパク質': 60.0,
    '炭水化物': 300.0,
    '脂質': 70.0,
    '糖質': 50.0,
    '塩分': 6.0,
    '食物繊維': 25.0,
  };

  Map<String, double> percentages = {};

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(seconds: 2),
      vsync: this,
    );

    calculatePercentages();
    startAnimation();
  }

  void calculatePercentages() {
    nutritionData.forEach((key, value) {
      percentages[key] = value / dailyIntake[key]!;
    });
  }

  void startAnimation() {
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          //padding: const EdgeInsets.all(1.0),

          child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 360,
              //width: 320,
              decoration: BoxDecoration(
                color: Colors.white, // 背景色を透明に設定
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.black, width: 1.5),
              ),
              child: NutritionMeter(
                percentages: percentages,
                animationController: _animationController,
                nutritionData: nutritionData,
                dailyIntake: dailyIntake,
              ),
            ),
          ],
        ),
      )),
    );
  }
}

class NutritionMeter extends StatelessWidget {
  final Map<String, double> percentages;
  final AnimationController animationController;
  final Map<String, double> dailyIntake;
  final Map<String, double> nutritionData;

  NutritionMeter({
    required this.percentages,
    required this.animationController,
    required this.dailyIntake,
    required this.nutritionData,
  });

  @override
  Widget build(BuildContext context) {
    var otherNutrients = percentages.keys.where((k) => k != 'カロリー').toList();

    // 各栄養素の最大値を計算
    var maxValues = {
      'カロリ-': dailyIntake['カロリー']!,
      for (var nutrient in otherNutrients) nutrient: dailyIntake[nutrient]!,
    };

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // 摂取カロリーを上側に大きく表示
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NutritionBar(
                nutrient: 'カロリー',
                value: dailyIntake['カロリー']!,
                maxValue: maxValues['カロリ-']!,
                color: Color(0xFF7FD1AE),
                animationController: animationController,
              ),
            ],
          ),
          //SizedBox(height: 0), // 上側と下側の要素の間隔
          // 他の要素を左右で3つずつ2列に表示
          for (var i = 0; i < otherNutrients.length; i += 2)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                NutritionBar(
                  nutrient: otherNutrients[i],
                  value: nutritionData[otherNutrients[i]]!,
                  maxValue: dailyIntake[otherNutrients[i]]!,
                  color: Color(0xFF7FD1AE),
                  animationController: animationController,
                ),
                SizedBox(
                  width: 25,
                ),
                if (i + 1 < otherNutrients.length)
                  NutritionBar(
                    nutrient: otherNutrients[i + 1],
                    value: nutritionData[otherNutrients[i + 1]]!,
                    maxValue: dailyIntake[otherNutrients[i + 1]]!,
                    color: Color(0xFF7FD1AE),
                    animationController: animationController,
                  ),
              ],
            ),
        ],
      ),
    );
  }
}

class NutritionBar extends StatelessWidget {
  final String nutrient;
  final double value;
  final double maxValue;
  final Color color;
  final AnimationController animationController;

  NutritionBar({
    required this.nutrient,
    required this.value,
    required this.maxValue,
    required this.color,
    required this.animationController,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomLeft,
          children: [
            // バーと値表示エリアの間隔
            Container(
              width: 150, // 値表示エリアの幅
              height: 86,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('$nutrient   :   '),
                      Text('${value}'),
                    ],
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // バーの角を丸く
              child: Container(
                width: (value / maxValue) * 150, // バーの幅を値に応じて変更
                height: 25, // バーの高さ
                color: color,
              ),
            ),
            Container(
              width: 150, // 最大値の表示エリアの幅
              height: 26,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), // 最大値のエリアの下部角を丸く
                border: Border.all(color: Colors.black, width: 1.5), // 最大値の枠線
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
