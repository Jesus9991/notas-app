import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PROVIDER: para transformar la informacion del usuario
*/
class UserInformationProvider extends ChangeNotifier {
  /*instancia de las preferencias */
  InfoUserPreferences preferences = InfoUserPreferences();
  /*carga la informacion del usuario */
  UserInformationProvider() {
    _getDetailsInformation();
  }

  /*datos a obtener */
  String _nameUser = '';
  String _emailUser = '';
  String _tokenUser = '';
  String _keyGoogleUser = '';
  String _createdDataUser = '';

  /*seteo de datos */
  String get nameUser => _nameUser;
  String get emailUser => _emailUser;
  String get tokenUser => _tokenUser;
  String get keyGoogleUser => _keyGoogleUser;
  String get createdDataUser => _createdDataUser;

  setValuesInfo({
    required String name,
    required String email,
    required String token,
    required String google,
    required String create,
  }) {
    _nameUser = name;
    _emailUser = email;
    _tokenUser = token;
    _keyGoogleUser = google;
    _createdDataUser = create;
  }

  /*obtiene los datos guardados en keys*/
  Future _getDetailsInformation() async {
    try {
      final name = await preferences.getkeyName();
      final email = await preferences.getkeyEmail();
      final token = await preferences.getkeyId();
      final google = await preferences.getkeyGoogle();
      final create = await preferences.getkeyCreated();

      setValuesInfo(
        name: name ?? '',
        email: email ?? '',
        token: token ?? '',
        google: google ?? '',
        create: create ?? '',
      );
      notifyListeners();
    } catch (e) {
      log('_getDetailsInformation $e');
    }
  }
}
