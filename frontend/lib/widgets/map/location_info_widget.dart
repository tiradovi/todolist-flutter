import 'package:flutter/material.dart';
import 'package:frontend/widgets/map/action_button.dart';

class LocationInfoWidget extends StatelessWidget {
  const LocationInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          const Text(
            '청담동ABC',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 16),
          const Text(
            '서울특별시 강남구 청담동ABC',
            style: TextStyle(color: Colors.black54),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ActionButton(
                  icon: Icons.directions,
                  label: '길찾기',
                  color: Colors.blue,
                  onPressed: () {/* 길찾기 기능 [내위치에서 대상 위치까지 네비게이션 확인]*/}),
              ActionButton(
                  icon: Icons.copy,
                  label: '주소 복사',
                  color: Colors.grey[700]!,
                  onPressed: () {
                    /* 주소 복사 기능 구현 */
                  }),
            ],
          )
        ],
      ),
    );
  }
}
