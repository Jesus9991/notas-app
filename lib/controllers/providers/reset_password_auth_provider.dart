// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PROVIDER: para el reseteo de la contraseña
*/
class ResetPasswordProvider extends ChangeNotifier {
  /*instancia de Firebase Authorization */
  final FirebaseAuth _authorization = FirebaseAuth.instance;
  FirebaseAuth get authorization => _authorization;

  /*loading para el botón */
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  //* CONTROLADORES PARA LOS INPUTS
  final TextEditingController _emailController = TextEditingController();
  TextEditingController get emailController => _emailController;

  setEmailController(String email) {
    _emailController.text = email; // eteo para el correo
    notifyListeners();
  }

  changeValuesStatus(bool status) {
    _isLoading = status; // cambia el estado del loading
    notifyListeners();
  }

  //* PETICIÓN PARA CAMBIAR LA CONTRASEÑA
  Future<void> resetPasswordUser(BuildContext context) async {
    try {
      changeValuesStatus(true);
      await _authorization.sendPasswordResetEmail(email: _emailController.text);

      /*si el correo es válido y el restablecimiento es exitoso */
      SnackbarWidget.showSnackBar(
        context,
        'restablecer correo electrónico enviado',
        Icons.check_circle,
        PaletteTheme.succesColor,
      );

      /*limpia y cerrar el provider */
      cleanAllProvider();
    } on FirebaseAuthException catch (e) {
      /*si ocurre un error relacionado con FirebaseAuth */
      if (e.code == 'invalid-email') {
        SnackbarWidget.showSnackBar(
          context,
          'formato de correo electrónico no válido',
          Icons.email,
          PaletteTheme.errorColor,
        );
      } else if (e.code == 'user-not-found') {
        SnackbarWidget.showSnackBar(
          context,
          'Usariocon correo electrónico no encontrado',
          Icons.email,
          PaletteTheme.errorColor,
        );
      } else {
        /*cualquier otro error relacionado con FirebaseAuth */
        SnackbarWidget.showSnackBar(
          context,
          'Error: ${e.message}',
          Icons.error,
          PaletteTheme.errorColor,
        );
      }
    } catch (e) {
      /*cualquier otro error fuera de FirebaseAuth (ejemplo de red, etc.) */
      SnackbarWidget.showSnackBar(
        context,
        'Error: $e',
        Icons.error,
        PaletteTheme.errorColor,
      );
    } finally {
      //cambio de estado
      changeValuesStatus(false);
    }
  }

  //* LIMPIADOR DEL PROVIDER
  cleanAllProvider() {
    _emailController.clear();
    _isLoading = false;
    notifyListeners();
  }
}
