import 'package:flutter/material.dart';
import '../../../../core/router/app_router.dart';

/// ViewModel simple (ChangeNotifier) para manejar acciones de la vista.
/// Para esta pantalla inicial no hay estado complejo, solo navegación.
class WelcomeViewModel extends ChangeNotifier {
  void onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.login);
  }

  void onTapRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.register);
  }
}
