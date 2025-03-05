import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/screens_exports.dart';

/*
manejo de rutas, de forma optmizada, en caso de usar solo se debe llamar la clase y a la ruta que se quiere navegar
*/

class MainRoutes {
  static const navBarRoute = '/nav_bar_route';
  static const loginScreenRoute = '/login_screen_route';
  static const registerScreenRoute = '/register_screen_route';
  static const resetPasswordScreenRoute = '/reset_screen_route';

  static Map<String, Widget Function(BuildContext)> routes = {
    /*-----RUTA INICIAL------*/
    // navBarRoute: (_) => const NavBarForsScreenWidgets(),
    //LOGGUEO
    loginScreenRoute: (_) => const LoginAuthScreen(),
    registerScreenRoute: (_) => const RegisterAuthScreen(),
    resetPasswordScreenRoute: (_) => const ResetPasswordAuthScreen(),
  };
}
