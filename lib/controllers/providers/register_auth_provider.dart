// ignore_for_file: use_build_context_synchronously
import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:notas_app/controllers/exports/exports.dart';

/*
PROVIDER PARA EL REGISTRO DEL USUARIO
*/
class RegisterAuthProvider extends ChangeNotifier {
  /*instanacia de Firebase autorization*/
  final FirebaseAuth _authorization = FirebaseAuth.instance;
  FirebaseAuth get authorization => _authorization;

  /*firebase*/
  final CollectionReference databaseReference =
      FirebaseFirestore.instance.collection(FirebasePath.user);

  /*instancia del shared preferences*/
  LoginDataPreferences dataPreferences = LoginDataPreferences();

  /*modelo de preferences*/
  InfoUserPreferences preferences = InfoUserPreferences();

  DateTime dateTimeNow = DateTime.now();

  //*CONTROLADORES PARA LOS INPUTS
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _fullNameController = TextEditingController();

  TextEditingController get emailController => _emailController;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get fullNameController => _fullNameController;

  //fecha
  String dateTimeFormat = '';

  /*loading para el boton*/
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  setEmailController(String email) {
    _emailController.text = email; //seteo para el correo
    notifyListeners();
  }

  setPasswordController(String password) {
    _passwordController.text = password; //seteo para la contra
    notifyListeners();
  }

  setFullName(String name) {
    _fullNameController.text = name; //nombre completo
    notifyListeners();
  }

  String _formatDayDate = '';
  String _formatDate = '';

  String get formatDayDate => _formatDayDate;
  String get formatDate => _formatDate;

  setFormatsDetailsDate(String day, String date) {
    _formatDayDate = day; //para mostrarle al usuario la fecha de registro
    _formatDate = date;
    notifyListeners();
  }

  setdateTimeFormat(String dateTime) {
    dateTimeFormat = dateTime; //formato de fechas
    notifyListeners();
  }

  changeValuesStatus(bool status) {
    _isLoading = status; //cambia el estado del loading
    notifyListeners();
  }

  //*REGISTRA AL USUARIO
  Future<void> registerUserLoggeo(BuildContext context) async {
    try {
      UserCredential userCredential =
          await authorization.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      final user = userCredential.user;

      if (user != null) {
        /*almacena el correo y el token */

        await dataPreferences.saveEmailUser(user.email ?? 'No email');
        await dataPreferences.saveTokenUser(user.uid);

        log('datos para el registro:  EMAIL:${user.email} ID: ${user.uid}');

        /*peticion para actualizar la coleccion de informacion del usaurio*/
        await databaseReference.doc(user.uid).set({
          "key_id": user.uid,
          "name_user": _fullNameController.text,
          "email_user": user.email,
          "created_user": dateTimeFormat,
        });

        /*envia un correo para verifcacion */
        await user.sendEmailVerification();

        await saveInformationUser(
          keyCreated: dateTimeFormat,
          keyName: _fullNameController.text,
          keyId: user.uid,
          keyEmail: user.email ?? '',
          keyGoogle: user.uid,
        );
        /*limpia el provider */
        cleanAllProvider();

        notifyListeners();

        /*navega a completar el perfil */
        WidgetsBinding.instance.addPostFrameCallback((_) {
          /*navega al home */
          Navigator.of(context).pushNamedAndRemoveUntil(
            MainRoutes.navBarRoute,
            (route) => false,
          );
        });
        SnackbarWidget.showSnackBar(
          context,
          'Usuario registrado con éxito',
          Icons.check_circle,
          PaletteTheme.succesColor,
        );
      } else {
        SnackbarWidget.showSnackBar(
          context,
          'Error registrar usuario',
          Icons.error,
          PaletteTheme.errorColor,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        /*cierra el modal */
        Navigator.pop(context);
        /*muestra un snacbar */
        SnackbarWidget.showSnackBar(
          context,
          'Contraseña débil',
          Icons.password,
          PaletteTheme.errorColor,
        );
      } else if (e.code == 'email-already-in-use') {
        /*cierra el modal */
        Navigator.pop(context);
        /*muestra un snacbar */
        SnackbarWidget.showSnackBar(
          context,
          'La cuenta existe',
          Icons.email,
          PaletteTheme.errorColor,
        );
      }
    } catch (e) {
      /*cierra el modal */
      Navigator.pop(context);
      /*muestra un snacbar */
      SnackbarWidget.showSnackBar(
        context,
        'Error: $e',
        Icons.error,
        PaletteTheme.errorColor,
      );
    }
  }

  //* VERIFICACION DE CORREO
  Future sendEmailVerifications() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        log("Correo de verificación enviado a ${user.email}");
      } else {
        log("El usuario ya ha verificado su correo o no existe.");
      }
    } catch (e) {
      log("Error al enviar el correo de verificación: $e");
    }
  }

//*LIMPIADOR DEL PROVIDER
  cleanAllProvider() {
    _emailController.clear();
    _passwordController.clear();
    _fullNameController.clear();
    dateTimeFormat = '';
    _isLoading = false;
    _formatDayDate = '';
    _formatDate = '';
    notifyListeners();
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
