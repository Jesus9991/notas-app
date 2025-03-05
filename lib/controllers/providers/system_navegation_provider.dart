import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PROVIDER: PARA EL SISTEMA DE NAVEGACION DE LA APP
*/
class SystemNavegationProvider extends ChangeNotifier {
  /*inicializa en el login*/
  String _tokenUser = '';
  String get tokenUser => _tokenUser;

  /*seteo de navegación*/
  Future setNavegationSystemUser() async {
    try {
      /*obtiene el token del usuario*/
      String? data = await LoginDataPreferences().getTokenUser();

      if (data != null) {
        /*si tiene token, va el home */
        _tokenUser = data;
        notifyListeners();
      } else {
        _tokenUser = '';

        notifyListeners();
      }
    } catch (e) {
      _tokenUser = '';
      /*elimina el token */
      await LoginDataPreferences().clearUserData();

      notifyListeners();
    }
    notifyListeners();
  }
}
