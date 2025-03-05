/*
Maneja los datos del inicio de sesion para almacenarlos en local
*/
import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';

class LoginDataPreferences {
  /*string para las keys */
  String keyForEmail = 'email_user';
  String keyForToken = 'token_user'; //token que se vence cada 30 mins

  /*guarda el valor seleccionado */
  Future<void> saveEmailUser(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyForEmail, value);
    log('saveEmailUser $value');
  }

  /*guarda el valor seleccionado */
  Future<void> saveTokenUser(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyForToken, value);
    // log('saveTokenUser $value');
  }

  /*recupera la opcion seleciconada */
  Future<String?> getEmailUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyForEmail);
  }

  /*recupera la opcion seleciconada */
  Future<String?> getTokenUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyForToken);
  }

  /*elimina todos los datos del usuario */
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyForEmail);

    await prefs.remove(keyForToken);
  }
}
