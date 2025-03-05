// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PROVIDER: para el inicio de sesion con google
*/
class SocialNetworkProvider extends ChangeNotifier {
  /*instancia de firebase */
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  /*firebase*/
  final CollectionReference databaseReference =
      FirebaseFirestore.instance.collection(FirebasePath.user);

  /*instancia del shared preferences*/
  LoginDataPreferences dataPreferences = LoginDataPreferences();

  /*modelo de preferences*/
  InfoUserPreferences preferences = InfoUserPreferences();

  /*loading para el boton*/
  bool _isLoadingForGoogle = false;
  bool get isLoadingForGoogle => _isLoadingForGoogle;

  changeLoadingForGoogle(bool status) {
    _isLoadingForGoogle = status; //cambia el estado del loading
    notifyListeners();
  }

  //*SESION CON GOOGLE
  Future<UserCredential?> signInWithGoogle(BuildContext context) async {
    try {
      /*desconecta al usuario*/
      // await GoogleSignIn().disconnect();
      await FirebaseAuth.instance.signOut();

      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      /*El usuario canceló el inicio de sesión */
      if (googleUser == null) {
        SnackbarWidget.showSnackBar(
          context,
          'Inicio de sesión cancelado',
          Icons.info,
          PaletteTheme.errorColor,
        );
        return null;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      /*inicia sesión en Firebase con las credenciales de Google */
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      /*verifica si el correo está registrado en tu base de datos */
      String email = userCredential.user?.email ?? '';
      final userDoc =
          await databaseReference.where('email_user', isEqualTo: email).get();

      if (userDoc.docs.isEmpty) {
        /*correo no registrado en la base de datos */
        SnackbarWidget.showSnackBar(
          context,
          'Correo electrónico no registrado',
          Icons.warning,
          PaletteTheme.errorColor,
        );

        /*cierra la sesión */
        await firebaseAuth.signOut();
        await GoogleSignIn().disconnect();
        return null;
      } else {
        /*inicio de sesión exitoso */
        SnackbarWidget.showSnackBar(
          context,
          'Inicio de sesión exitoso',
          Icons.check_circle,
          PaletteTheme.succesColor,
        );

        await LoginDataPreferences().saveTokenUser(userCredential.user!.uid);
        await LoginDataPreferences().saveEmailUser(email);

        //Todo: debe cambiar la foto de perfil en la base sql si el campo de photo està vacio

        final tokenUser = await LoginDataPreferences().getTokenUser();

        log('token user $tokenUser');

        if (tokenUser != null) {
          /*token del usuario */
          /*actualiza el id de gooogle */
          await databaseReference.doc(tokenUser).update(
            {
              'google': userCredential.user?.uid,
            },
          );

          /*actualiza la base SQL con los datos de Firestore*/
          await updateUserInfoInSQL(tokenUser); // actualización en SQL
        }

        /*navega a la pantalla deseada */
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.pushReplacementNamed(
            context,
            MainRoutes.navBarRoute,
          );
        });
      }

      notifyListeners();
      return userCredential;
    } catch (e) {
      log('error login google $e');
      /*maneja cualquier otro error */
      SnackbarWidget.showSnackBar(
        context,
        'Error de inicio de sesión de google',
        Icons.error,
        PaletteTheme.errorColor,
      );
      return null;
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
    await preferences.savekeyCreated(keyCreated);
    await preferences.savekeyEmail(keyEmail);
    await preferences.savekeyGoogle(keyGoogle);
    await preferences.savekeyId(keyId);
    await preferences.savekeyName(keyName);

    notifyListeners();
  }
}
