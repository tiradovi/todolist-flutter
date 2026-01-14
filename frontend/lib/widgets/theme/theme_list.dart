import 'package:flutter/material.dart';
import 'package:frontend/widgets/theme/theme_card.dart';
import 'package:frontend/widgets/theme/theme_purchase_dialog.dart';

import '../../providers/theme_provider.dart';

class ThemeList extends StatelessWidget {
  final ThemeProvider themeProvider;

  const ThemeList({super.key, required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    final themes = [
      (AppThemeType.purple, const Color(0xFF6200EE)),
      (AppThemeType.pink, const Color(0xFFE91E63)),
      (AppThemeType.blue, const Color(0xFF2196F3)),
    ];

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text('테마선택'),
        ...themes.map((data) => Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: ThemeCard(
              themeProvider: themeProvider,
              theme: data.$1,
              color: data.$2,
              onPurchaseRequested: () => showDialog(
                  context: context,
                  builder: (_) => ThemePurchaseDialog(
                      themeProvider: themeProvider, theme: data.$1))),
        ))
      ],
    );
  }
}