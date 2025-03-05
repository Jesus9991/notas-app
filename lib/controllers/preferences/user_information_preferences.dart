import 'dart:developer';
import 'package:shared_preferences/shared_preferences.dart';
/*
preferencias para manejar la informacion del usuario
*/

class InfoUserPreferences {
  /*key para los datos*/
  String keyCreated = 'key_created';
  String keyEmail = 'key_email';
  String keyGoogle = 'key_google';
  String keyId = 'key_id';
  String keyName = 'key_name';

  /*guarda el valor seleccionado */
  Future<void> savekeyCreated(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyCreated, value);
    log('savekeyCreated $value');
  }

  /*guarda el valor seleccionado */
  Future<void> savekeyEmail(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyEmail, value);
    log('savekeyEmail $value');
  }

  /*guarda el valor seleccionado */
  Future<void> savekeyGoogle(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyGoogle, value);
    log('savekeyGoogle $value');
  }

  /*guarda el valor seleccionado */
  Future<void> savekeyId(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyId, value);
    log('keyId $value');
  }

  /*guarda el valor seleccionado */
  Future<void> savekeyName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(keyName, value);
    log('keyName $value');
  }

  //------LECTURA DE DATOS-------//

  Future<String?> getkeyCreated() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyCreated);
  }

  Future<String?> getkeyEmail() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyEmail);
  }

  Future<String?> getkeyGoogle() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyGoogle);
  }

  Future<String?> getkeyId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyId);
  }

  Future<String?> getkeyName() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(keyName);
  }

  /*elimina todos los datos del usuario */
  Future<void> clearUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(keyCreated);
    await prefs.remove(keyEmail);
    await prefs.remove(keyGoogle);
    await prefs.remove(keyId);
    await prefs.remove(keyName);
    // await prefs.remove(keyPhoto);
  }
}
