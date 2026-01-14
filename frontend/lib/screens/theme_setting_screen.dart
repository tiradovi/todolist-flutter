import 'package:flutter/material.dart';
import 'package:frontend/providers/theme_provider.dart';
import 'package:frontend/widgets/theme/theme_list.dart';
import 'package:provider/provider.dart';

class ThemeSettingScreen extends StatelessWidget {
  const ThemeSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("테마 설정"),
        ),
        body: Consumer<ThemeProvider>(
          builder: (context, themeProvider, child) {
            return ThemeList(themeProvider: themeProvider);
          },
        ));
  }
}
