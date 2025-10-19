import 'package:flutter/material.dart';
import 'package:carpooling_ulima/feature/auth/presentation/welcome/welcome_view.dart';
import 'package:carpooling_ulima/feature/auth/presentation/login/login_view.dart';
import 'package:carpooling_ulima/feature/auth/presentation/register/register_view.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String register = '/register';

  static final Map<String, WidgetBuilder> routes = {
    initialRoute: (_) => const WelcomeView(),
    login: (_) => const LoginView(),
    register: (_) => const RegisterView(),
  };
}
