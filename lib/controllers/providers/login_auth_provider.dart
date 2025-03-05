// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PROVIDER PARA EL INICIO DE SESION DEL USUARIO
*/
class LoginAuthProvider extends ChangeNotifier {
  /*instanacia de Firebase autorization*/
  final FirebaseAuth _authorization = FirebaseAuth.instance;
  FirebaseAuth get authorization => _authorization;

  /*instancia del shared preferences*/
  LoginDataPreferences dataPreferences = LoginDataPreferences();

  /*firebase*/
  final CollectionReference databaseReference =
      FirebaseFirestore.instance.collection(FirebasePath.user);

  /*modelo de preferences*/
  InfoUserPreferences userData = InfoUserPreferences();

  /*loading para el boton*/
  bool _isLoading = false;
  bool get isLoading => _isLoading;

//*CONTROLADORES PARA LOS INPUTS
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;

  setEmailController(String email) {
    _emailController.text = email; //seteo para el correo
    notifyListeners();
  }

  setPasswordController(String password) {
    _passwordController.text = password; //seteo para la contra
    notifyListeners();
  }

  changeValuesStatus(bool status) {
    _isLoading = status; //cambia el estado del loading
    notifyListeners();
  }

  //*INICIO DE SESIÒN
  Future postSesionLoggeoUser(BuildContext context) async {
    _isLoading = true;
    try {
      UserCredential userCredential = await _authorization
          .signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      )
          .timeout(
        const Duration(seconds: 20),
        onTimeout: () {
          throw TimeoutException('Request Expired');
        },
      );

      final data = userCredential.user;

      if (data != null) {
        /*almacena el correo y el token */
        await dataPreferences.saveEmailUser(data.email ?? 'No email');
        await dataPreferences.saveTokenUser(data.uid);

        await updateUserInfoInSQL(data.uid);

        /*limpia el provider */
        cleanAllProvider();
        /*estado del loading */
        _isLoading = false;

        notifyListeners();

        WidgetsBinding.instance.addPostFrameCallback(
          (_) {
            /*navega al home*/
            Navigator.of(context).pushNamedAndRemoveUntil(
              MainRoutes.navBarRoute,
              (route) => false,
            );
          },
        );
      } else {
        /*estado del loading */
        _isLoading = false;
        SnackbarWidget.showSnackBarAction(
          context,
          message: 'Usuario no encontrado',
          icon: Icons.email,
          colorIcon: PaletteTheme.errorColor,
          titleAction: 'Registrarse',
          onTap: () {
            //Todo: debe navegar a la pantalla de registrarse
          },
        );
      }
    } on FirebaseAuthException catch (e) {
      String errorMessage;
      IconData errorIcon = Icons.error_outline_rounded;
      /*estado del loading */
      _isLoading = false;

      switch (e.code) {
        case 'user-not-found':
          /*estado del loading */
          _isLoading = false;
          errorMessage = 'Usuario no encontrado';
          errorIcon = Icons.account_circle_sharp;
          SnackbarWidget.showSnackBarAction(
            context,
            message: 'Usuario no encontrado',
            icon: Icons.email,
            colorIcon: PaletteTheme.errorColor,
            titleAction: 'Registrarse',
            onTap: () {
              //Todo: debe navegar a la pantalla de registrarse
            },
          );
          break;
        case 'wrong-password':
          /*estado del loading */
          _isLoading = false;
          errorMessage = 'Contraseña invalida';
          errorIcon = Icons.password;
          SnackbarWidget.showSnackBar(
            context,
            errorMessage,
            errorIcon,
            PaletteTheme.errorColor,
          );
          break;
        case 'invalid-email':
          /*estado del loading */
          _isLoading = false;
          errorMessage = 'Correo invalido';
          errorIcon = Icons.email;
          SnackbarWidget.showSnackBar(
            context,
            errorMessage,
            errorIcon,
            PaletteTheme.errorColor,
          );
          break;
        case 'user-disabled':
          /*estado del loading */
          _isLoading = false;
          errorMessage = 'Cuenta desactivada';
          SnackbarWidget.showSnackBar(
            context,
            errorMessage,
            errorIcon,
            PaletteTheme.errorColor,
          );
          break;
        case 'too-many-requests':
          /*estado del loading */
          _isLoading = false;
          errorMessage = 'Demasiados intentos';
          SnackbarWidget.showSnackBar(
            context,
            errorMessage,
            errorIcon,
            PaletteTheme.errorColor,
          );
          break;
        case 'operation-not-allowed':
          /*estado del loading */
          _isLoading = false;
          errorMessage = 'Operación no permitida';
          SnackbarWidget.showSnackBar(
            context,
            errorMessage,
            errorIcon,
            PaletteTheme.errorColor,
          );
          break;
        default:
          /*estado del loading */
          _isLoading = false;
          errorMessage = 'Error: ${e.message}';
          SnackbarWidget.showSnackBarAction(
            context,
            message: 'Usuario no encontrado',
            icon: Icons.email,
            colorIcon: PaletteTheme.errorColor,
            titleAction: 'Registrarse',
            onTap: () {
              //Todo: debe navegar a la pantalla de registrarse
            },
          );
      }
    } on TimeoutException catch (e) {
      /*estado del loading */
      _isLoading = false;
      SnackbarWidget.showSnackBar(
        context,
        e.message ?? 'Expiración',
        Icons.timer_off,
        PaletteTheme.errorColor,
      );
    } catch (e) {
      /*estado del loading */
      _isLoading = false;
      log('Error en el inicio de sesión: $e');

      SnackbarWidget.showSnackBar(
        context,
        'Error inesperado',
        Icons.error_outline_rounded,
        PaletteTheme.errorColor,
      );
    }
  }

  /*metodo para actualizar datos en la base SQL */
  Future<void> updateUserInfoInSQL(String userId) async {
    try {
      /*consulta a Firestore usando el UID */
      final userDoc = await databaseReference.doc(userId).get();

      if (userDoc.exists) {
        await saveInformationUser(
          keyCreated: userDoc["created_user"],
          keyEmail: userDoc["email_user"],
          keyGoogle: userDoc["key_google"],
          keyId: userDoc["key_id"],
          keyName: userDoc["name_user"],
        );

        notifyListeners();

        log("Información del usuario actualizada.");
      } else {
        log("No se encontró la información del usuario en Firestore.");
      }
    } catch (e) {
      log("Error al actualizar la información: $e");
    }
  }

  /*guarda la informacion del usaurio en local */
  saveInformationUser({
    required String keyCreated,
    required String keyEmail,
    required String keyGoogle,
    required String keyId,
    required String keyName,
  }) async {
    await userData.savekeyCreated(keyCreated);
    await userData.savekeyEmail(keyEmail);
    await userData.savekeyGoogle(keyGoogle);
    await userData.savekeyId(keyId);
    await userData.savekeyName(keyName);

    notifyListeners();
  }

//*LIMPIADOR DEL PROVIDER
  cleanAllProvider() {
    _emailController.clear();
    _passwordController.clear();
    _isLoading = false;
    notifyListeners();
  }
}
