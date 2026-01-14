import 'package:flutter/material.dart';


enum AppThemeType {
  purple, //무료
  pink, //유료
  blue //유료
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
            secondary: const Color(0xFF03DAC6)
        );
      case AppThemeType.pink:
        return _buildTheme(
            primary: const Color(0xFFE91E63),
            secondary: const Color(0xFF03DAC6)
        );
      case AppThemeType.blue:
        return _buildTheme(
            primary: const Color(0xFF2196F3),
            secondary: const Color(0xFF00BCD4));
    }
  }


  ThemeData _buildTheme({
    required Color primary,
    required Color secondary,
  }) {
    return ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: primary, secondary: secondary),
        scaffoldBackgroundColor: const Color(
            0xFFF5F5F5)
    );
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
    }
  }
}