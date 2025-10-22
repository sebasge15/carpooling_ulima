import 'package:flutter/material.dart';

// Auth
import '../../feature/auth/presentation/welcome/welcome_view.dart';
import '../../feature/auth/presentation/login/login_view.dart';
import '../../feature/auth/presentation/register/register_view.dart';

// Rides
import '../../feature/rides/presentation/driver_list/driver_list_view.dart';
import '../../feature/rides/presentation/driver_route/driver_route_view.dart';
import '../../feature/rides/presentation/register_ride/register_ride_view.dart';

class AppRouter {
  static const String initialRoute = '/';
  static const String login = '/login';
  static const String register = '/register';

  // Rides
  static const String driverList = '/drivers';
  static const String driverRoute = '/drivers/route';
  static const String registerRide = '/drivers/register';

  static Map<String, WidgetBuilder> get routes => {
    AppRouter.initialRoute: (_) => const WelcomeView(),
    AppRouter.login: (_) => const LoginView(),
    AppRouter.register: (_) => const RegisterView(),
    AppRouter.driverList: (_) => const DriverListView(),
    AppRouter.driverRoute: (_) => const DriverRouteView(),
    AppRouter.registerRide: (_) => const RegisterRideView(),
  };
}

