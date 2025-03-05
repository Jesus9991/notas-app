import 'package:flutter/material.dart';
import 'package:notas_app/controllers/exports/exports.dart';
import 'package:notas_app/controllers/services/format_datatime_service.dart';
import 'package:provider/provider.dart';

/*
PANTALLA: registro de usuario
*/
class RegisterAuthScreen extends StatefulWidget {
  const RegisterAuthScreen({super.key});

  @override
  State<RegisterAuthScreen> createState() => _RegisterAuthScreenState();
}

class _RegisterAuthScreenState extends State<RegisterAuthScreen> {
  DateTime now = DateTime.now();

  /*key*/
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GradientBackground(child: Consumer<RegisterAuthProvider>(
      builder: (context, register, child) {
        return Form(
          key: formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
                horizontal: size.width * .04, vertical: size.height * .03),
            physics: const BouncingScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            children: [
              SizedBox(height: size.height * .06),
              //logo
              LogoTitleComponent(isViewLogo: true),
              SizedBox(height: size.height * .03),
              //inputs-correo
              InputsComponents(
                hintext: 'Ingresar nombre y apellido',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
                controller: register.fullNameController,
                validator: (val) => ValidationInputs.inputEmpty(val),
                onChanged: (val) => register.setFullName(val),
              ),
              SizedBox(height: size.height * .03),
              //inputs-correo
              InputsComponents(
                hintext: 'Ingresar correo electrónico',
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
                controller: register.emailController,
                validator: (val) => ValidationInputs.email(val),
                onChanged: (val) => register.setEmailController(val),
              ),
              SizedBox(height: size.height * .03),
              //iputs-contraseña
              InputPasswordComponent(
                hintext: 'Ingresar contraseña',
                validator: (val) => ValidationInputs.password(val),
                controller: register.passwordController,
                onChanged: (val) => register.setPasswordController(val),
              ),

              SizedBox(height: size.height * .03),
              //boton para registrarse
              CustomButton(
                text: 'Registrarse',
                isLoading: false,
                onTap: () {
                  if (formKey.currentState!.validate()) {
                    // Ejemplo: Lunes, 10:00 am
                    final dayDate = FormatDatatimeService.formatHora(now);
                    // Ejemplo: Marzo 03, 2025
                    final dateTime = FormatDatatimeService.formatFecha(now);

                    register.setdateTimeFormat('$dateTime $dayDate');
                    register.setFormatsDetailsDate(dayDate, dateTime);
                    /*navega a la pantalla de bienvenida*/
                    Navigator.pushNamed(
                      context,
                      MainRoutes.welcomeScreenRoute,
                    );
                  } else {
                    return SnackbarWidget.showSnackBar(
                      context,
                      'Faltan datos por llenar',
                      Icons.error,
                      PaletteTheme.errorColor,
                    );
                  }
                },
              ),
              SizedBox(height: size.height * .03),

              LoginRichTextOnTap(
                title: '¿Ya tienes una cuenta?',
                subtitle: ' Iniciar sesión',
                onTap: () => Navigator.pop(context),
              ),
            ],
          ),
        );
      },
    ));
  }
}
