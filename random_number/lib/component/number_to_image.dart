import 'package:flutter/material.dart';

class NumberToImage extends StatelessWidget {
  /// number 지정해줘 반드시 초기화되어 필수로 지정되어야 하고
  final int number;

  const NumberToImage({
    required this.number,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// 각 숫자는 가로로 배치함
    return Row(
      children: number
          .toString()
          .split('')
          .map(
            (number) => Image.asset(
              'assets/img/$number.png',
              width: 50.0,
              height: 70.0,
            ),
          )
          .toList(),
    );
  }
}

/// width: 50.0, height: 70.0로 고정된 크기 설정
