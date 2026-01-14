import 'package:flutter/material.dart';
import '../../providers/theme_provider.dart';

/*
onTap = 제스처 감지 위젯
  => 개발자가 만든 커스텀 위젯을 클릭 가능하게 만들기 위해서 사용

GestureDetector = 다양한 제스처 감지, 기본 효과 없음// Button 형태가 아닌 커스텀 위젯
- onTap: () => print("클릭 한 번") -> 버튼 내부에 존재시 사용 지양
- onDoubleTap: () => print("클릭 두 번") -> 두 번 클릭시 이런 효과 추가 예정
- onLongPress : () => print("길게 누름")
- onPanUpdate : () => print("드래그 중") -> 드래그시 이런 효과를 주겠다.

InkWell = 클릭 시 물결 효과, Material Design (GestureDetector와 같으나 효과만 추가)

onPress = 버튼 계열 위젯
TextButton ElevatedButton IconButton 계열에서 사용

onTap과 onPress 같이 사용시 충돌
 */

class ThemeCard extends StatelessWidget {
  final ThemeProvider themeProvider;
  final AppThemeType theme;
  final Color color;
  final VoidCallback onPurchaseRequested;

  const ThemeCard(
      {super.key,
      required this.themeProvider,
      required this.theme,
      required this.color,
      required this.onPurchaseRequested});

  @override
  Widget build(BuildContext context) {
    final isSelected = themeProvider.currentTheme == theme;
    final isPurchased = themeProvider.isThemePurchased(theme);
    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(12),
          side: BorderSide(
              color: isSelected ? color : Colors.transparent, width: 2)),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        splashColor:
            Colors.blue.withValues(alpha: 0.3, red: 0.8, green: 0.6, blue: 0.9),
        highlightColor: Colors.grey.withValues(alpha: 0.2),
        onTap: isPurchased
            ? () => themeProvider.changeTheme(theme)
            : onPurchaseRequested,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: color, borderRadius: BorderRadius.circular(8)),
              ),
              const SizedBox(width: 16),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    themeProvider.getThemeName(theme),
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  )
                ],
              )),
              Icon(isSelected ? Icons.check_circle : (isPurchased ? Icons.circle_outlined : Icons.lock_outline),
                color: isSelected ? color : Colors.grey[400],
                size: 28,
              )
            ],
          ),
        ),
      ),
    );
  }
}
