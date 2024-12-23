import 'package:flutter/material.dart';
import 'package:random_number/component/number_to_image.dart';
import 'package:random_number/constant/color.dart';

/// SettingScreen으로 뷰 변화 살펴봐
class SettingScreen extends StatefulWidget {
  final int maxNumber;
  const SettingScreen({
    /// maxNumber지정해주고 반드시 초기화해주기
    required this.maxNumber,
    super.key,
  });

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

/// _SettingScreenState 변경될때마다 변경
class _SettingScreenState extends State<SettingScreen> {
  /// maxNumber은 처음에 1000 double형
  double maxNumber = 1000;

  ///  initState로 시작할때 상태 지정
  void initState() {
    super.initState();

    /// maxNumber은 widget.maxNumber를 double형으로 변해줘
    maxNumber = widget.maxNumber.toDouble();
  }

  @override
  Widget build(BuildContext context) {
    /// 이제 뷰에서 Scaffold로 위젯 이용하고
    return Scaffold(
      /// 배경색은 primaryColor
      backgroundColor: primaryColor,

      /// body는 SafeArea로 노치가  무조건 보이게 해주기
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _Number(
                maxNumber: maxNumber,
              ),
              _Slider(onChanged: onSliderChanged, value: maxNumber),
              _Button(
                onPressed: onSavePressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  onSavePressed() {
    Navigator.of(context).pop(
      maxNumber.toInt(),
    );
  }

  onSliderChanged(double value) {
    setState(() {
      maxNumber = value;
    });
  }
}

class _Button extends StatelessWidget {
  final VoidCallback onPressed;

  const _Button({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: redColor,
        foregroundColor: Colors.white,
      ),
      onPressed: onPressed,
      child: Text("저장"),
    );
  }
}

class _Number extends StatelessWidget {
  final double maxNumber;

  const _Number({required this.maxNumber, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      child: NumberToImage(
        number: maxNumber.toInt(),
      ),
    ));
  }
}

class _Slider extends StatelessWidget {
  final double value;
  final ValueChanged<double> onChanged;

  const _Slider({
    required this.onChanged,
    required this.value,
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: value,
      min: 100,
      max: 100000,
      onChanged: onChanged,
    );
  }
}
