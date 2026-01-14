import 'package:frontend/common/constants.dart';
import 'package:frontend/screens/login_screen.dart';
import 'package:frontend/screens/setting_screen.dart';
import 'package:frontend/screens/theme_setting_screen.dart';
import 'package:frontend/screens/todo_detail_screen.dart';
import 'package:frontend/screens/todo_list_screen.dart';
import 'package:go_router/go_router.dart';

import '../screens/error_screen.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
      initialLocation: "/",
      routes: [
        GoRoute(
            path: RouteConstants.home,
            name: "home",
            builder: (context, state) => const TodoListScreen()),
        GoRoute(
            path: RouteConstants.login,
            name: "login",
            builder: (context, state) => const LoginScreen()),
        GoRoute(
            path: '${RouteConstants.todoDetail}/:id',
            name: "detail",
            builder: (context, state) {
              return TodoDetailScreen(id: state.pathParameters['id']!);
            }),
        GoRoute(
            path: RouteConstants.settings,
            name: "settings",
            builder: (context, state) => const SettingScreen(),
            routes: [
              GoRoute(
                  path: RouteConstants.theme,
                  name: "theme",
                  builder: (context, state) => const ThemeSettingScreen()),
            ]),
      ],
      errorBuilder: (context, state) => ErrorScreen(error: Exception(state)));
}
