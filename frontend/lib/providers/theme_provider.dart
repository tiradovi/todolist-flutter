import 'package:flutter/material.dart';

enum AppThemeType {
  purple, //무료
  pink, //유료
  blue, //유료
  green // 내가 만든거
}

// 테마가 변경됨을 전체적으로 설정하기 위해 공지하여변경하겠다 클래스를 함께 사용
class ThemeProvider with ChangeNotifier {
  AppThemeType _currentTheme = AppThemeType.purple;

  final Set<AppThemeType> _purchasedThemes = {AppThemeType.purple};

  AppThemeType get currentTheme => _currentTheme;

  bool isThemePurchased(AppThemeType theme) => _purchasedThemes.contains(theme);

  ThemeData get themeData {
    switch (_currentTheme) {
      case AppThemeType.purple:
        return _buildTheme(
            primary: const Color(0xFF6200EE),
            secondary: const Color(0xFF03DAC6));
      case AppThemeType.pink:
        return _buildTheme(
            primary: const Color(0xFFE91E63),
            secondary: const Color(0xFF03DAC6));
      case AppThemeType.blue:
        return _buildTheme(
            primary: const Color(0xFF2196F3),
            secondary: const Color(0xFF00BCD4));
      case AppThemeType.green:
        return _buildTheme(
            primary: const Color(0xFF50D50D),
            secondary: const Color(0xFF36EDFF));
    }
  }

  ThemeData _buildTheme({
    required Color primary,
    required Color secondary,
  }) {
    return ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(
                seedColor: primary,
                secondary: secondary,
                surface: Colors.green[50],

            ),
        iconTheme: IconThemeData(
          color: secondary,
        ),
        iconButtonTheme: IconButtonThemeData(
          style: IconButton.styleFrom(
            foregroundColor: secondary,
          ),
        ),
        scaffoldBackgroundColor: const Color(0xffbaf6b1));
  }

  void changeTheme(AppThemeType theme) {
    if (_purchasedThemes.contains(theme)) {
      _currentTheme = theme;
      notifyListeners();
    }
  }

  Future<bool> purchaseTheme(AppThemeType theme) async {
    await Future.delayed(const Duration(seconds: 1));

    _purchasedThemes.add(theme);
    notifyListeners();
    return true;
  }

  String getThemeName(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.purple:
        return 'Purple (Default)';
      case AppThemeType.pink:
        return 'Pink Theme';
      case AppThemeType.blue:
        return 'Blue Theme';
      case AppThemeType.green:
        return 'Greeeen Theme';
    }
  }

  String getThemePrice(AppThemeType theme) {
    switch (theme) {
      case AppThemeType.purple:
        return 'Free';
      case AppThemeType.pink:
        return '2,200';
      case AppThemeType.blue:
        return '3,300';
      case AppThemeType.green:
        return '95,000';
    }
  }
}
