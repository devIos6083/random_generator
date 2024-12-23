import 'package:flutter/material.dart';
import 'package:random_number/constant/color.dart';
import 'package:random_number/component/number_to_image.dart';
import 'package:random_number/constant/color.dart';
import 'dart:math';
import 'package:random_number/screen/setting_screen.dart';
/// HomeScreen 상태로 받고
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
/// _HomeScreenState 입력의 변화를 감지해
class _HomeScreenState extends State<HomeScreen> {
  /// numbers에 123 456 789 넣고 maxNumber는 1000이야
  List<int> numbers = [
    123,
    456,
    789
  ];

  int maxNumber= 1000;


  @override
  Widget build(BuildContext context) {
    /// Scaffold를 이용해서 있는 위젯을 변환할꺼고
    return Scaffold(
      /// 배경색은 primaryColor로 지정해줘
      backgroundColor: primaryColor,
      /// body부분은 Safearea로 가려지지 않게 해줘
      body: SafeArea(
        /// child에 padding이용해서 edgeInsets를 이용해서 좌우 16.0 패딩 넣어주기
          child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: 16.0,
              ),
            /// column 지정까지 해줘
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                _Header(
                    onPressed: onSettingIconPressed,
                ),

                _Body(
                    numbers: numbers,
                ),

                _Footer(
                    onPressed: generateRandomNumber,
                ),

              ],
            ),
          ),
      ),
    );
  }

  onSettingIconPressed() async {
    final result = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) {
          return SettingScreen(
            maxNumber: maxNumber,
          );
        },
      ),
    );

    maxNumber = result;
  }

  generateRandomNumber() {
    final rand = Random();

    final Set<int> newNumbers = {};

    while (newNumbers.length < 3) {
      final randomNumber = rand.nextInt(maxNumber);

      newNumbers.add(randomNumber);
    }

    setState(() {
      numbers = newNumbers.toList();
    });
  }
}

class _Header extends StatelessWidget {
  final VoidCallback onPressed;

  const _Header({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
            "랜덤 숫자 생성기",
          style: TextStyle(
            color: Colors.white,
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
          ),
        ),
        IconButton(
            onPressed: onPressed,
            color: redColor,
          icon: Icon(
            Icons.settings,
          ),
        )
      ],
    );
  }
}

class _Body extends StatelessWidget {

  final List<int> numbers;

  const _Body({
    required this.numbers,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: numbers
            .map(
                (e) => NumberToImage(
                    number: e,
                ),
            )
            .toList(),
        ),
    );
  }
}

class _Footer extends StatelessWidget {
  final VoidCallback onPressed;

  const _Footer({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: redColor,
          foregroundColor: Colors.white,
        ),
      child: Text("생성하기!"),
    );
  }
}








