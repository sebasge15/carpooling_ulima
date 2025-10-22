import 'package:flutter/material.dart';
import '../../../../core/router/app_router.dart';

class WelcomeViewModel extends ChangeNotifier {
  void onTapLogin(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.login);
  }

  void onTapRegister(BuildContext context) {
    Navigator.pushNamed(context, AppRouter.register);
  }
}
